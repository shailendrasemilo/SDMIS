import { state } from '@angular/animations';
import { ConditionalExpr } from '@angular/compiler';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-student-basic-info',
  templateUrl: './student-basic-info.component.html',
  styleUrls: ['./student-basic-info.component.css']
})
export class StudentBasicInfoComponent implements OnInit {

  @Output() event = new EventEmitter<any>();
  requestDTO: any = {};
  profileDetails: any = {};
  classMapping: any = {};
  mstClassSection: any = [];
  schoolList: any = [];

  religionList: any = [];
  motherTongueList: any = [{ name: 'Hindi', id: 1 }, { name: 'English', id: 2 }];
  disabilityList: any = [{ name: "Not Applicable", key: 0 },
  { name: "Blindness", key: 1 },
  { name: "Low-vision", key: 2 },
  { name: "Hearing impairment(deafandhardofhearing)", key: 3 },
  { name: "Speech and Language disability", key: 4 },
  { name: "Locomotor Disability", key: 5 },
  { name: "Mental Illness", key: 6 },
  ]
  socialCategoryList: any = [];
  sectionList: any = [];
  classList: any = [];


  stateList: any = [];
  districtList: any = [];
  blockList: any = [];

  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;

  userObj: any = {};

  constructor(private httpService: HttpService, public common: CommonService) { }


  ngOnInit(): void {
    this.getStateList();
    this.userObj = this.common.userObj;
    if (this.userObj.userType == 'B') {
      this.getSchoolByBlock(this.userObj.blockCode);
    }
    if (this.common.studentAction == 'edit') {
      this.getStdBasicInfo();
    } else if (this.common.studentAction == 'add') {
      this.profileDetails.stateCode = this.common.schoolDetail.stateCode
      this.profileDetails.districtCode = this.common.schoolDetail.districtCode;
      this.profileDetails.blockCode = this.common.schoolDetail.blockCode;
      this.classMapping.stateCode = this.common.schoolDetail.stateCode
      this.classMapping.districtCode = this.common.schoolDetail.districtCode;
      this.classMapping.blockCode = this.common.schoolDetail.blockCode;
      this.getMasterData();

    }

    if (this.userObj.userType == 'S') {
      let interval = setInterval(() => {
        console.log('interval')
        if (this.common.schoolDetail) {
          console.log('found')
          this.getClassBySchoolRange(this.common.schoolDetail.classFrom, this.common.schoolDetail.classTo)
          clearInterval(interval)
        }
      }, 1)
    }
  }
  getClassBySchoolRange(classFrom, classTo) {
    this.classList = this.common.createSchoolClassList(classFrom, classTo);
    this.schoolList.filter(schoolObj => {
      if (schoolObj.udiseCode == this.classMapping.udiseCode) {
        this.common.schoolDetail = schoolObj;
      }
    })
  }

  getSchoolByBlock(blockCode) {
    this.httpService.getAllSchoolByBlock(blockCode, 1, 1).subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.httpSuccess) {
        this.httpService.getAllSchoolByBlock(blockCode, 1, res.data.totalSize).subscribe(res2 => {
          console.log(res2)
          if (res2.statusCode == environment.httpSuccess) {
            this.schoolList = res2.data.result;
          }
        })
      } else {
        this.alertMsg = res.statusMessage;
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      }
    })
  }

  getMasterData() {
    this.getSocialCategory();
    this.getReligionList();
  }

  getSocialCategory() {
    this.httpService.getSocialCategory().subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.httpSuccess) {
        this.socialCategoryList = res.data.result;
        this.socialCategoryList.forEach(element => {
          element.code = parseInt(element.code)
        });
      } else {
        console.log('error')
      }
    }, error => {
      console.log(error)

    })
  }
  getReligionList() {
    this.httpService.getReligion().subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.httpSuccess) {
        this.religionList = res.data.result;
        this.religionList.forEach(element => {
          element.code = parseInt(element.code)
        });
      } else {
        console.log('error')

      }
    }, error => {
      console.log(error)


    })
  }

  getStateList() {
    this.httpService.getStates().subscribe(res => {
      console.log(res);
      if (res.length > 0) {
        this.stateList = res;
      }
    }, error => {
      console.log(error)
    })
  }

  checkStdClass(className) {
    this.classList.filter(obj => {
      if (obj.id == className) {
        this.common.stdClass = obj.value
      }
    })
    console.log(this.common.stdClass)
  }

  getSectionList(className) {
    console.log(className)
    let udiseCode;
    if (this.userObj.userType == 'S') {
      udiseCode = this.userObj.schoolId
    } else if (this.userObj.userType == 'B') {
      udiseCode = this.classMapping.udiseCode;
    }
    this.httpService.getClassSection(className, udiseCode).subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.successCode) {
        this.sectionList = res.mstClassSections
      } else {
        this.sectionList = [];
        this.alertFlag = true;
        this.alertCount = this.alertCount + 1
        this.alertMsg = 'No sections have been created for this class.';
      }
    })
  }

  getStdBasicInfo() {
    this.httpService.getStudentBasicInfoById(this.common.stdIdEdit, this.common.schoolDetail.udiseCode).subscribe(data => {
      console.log(data)
      if (data.studentBasicDetail) {

        this.profileDetails = data.studentBasicDetail;
        this.profileDetails.dob = new Date(this.profileDetails.dob)
        this.profileDetails.doa = new Date(this.profileDetails.doa)
      } if (data.sectionClassMapping) {
        this.classMapping = data.sectionClassMapping;
        this.checkStdClass(this.classMapping.className)
      }

      this.getDistrictList(this.profileDetails.stateId);
      this.getSectionList(this.classMapping.className)
      this.getMasterData()
    })
  }

  getDistrictList(stateId) {
    console.log(stateId)
    this.httpService.getDistrictsByState(stateId).subscribe(res => {
      if (res.length > 0) {
        console.log(res)
        this.districtList = res;
        if (this.common.studentAction == 'edit') {
          this.getBlockList(this.profileDetails.districtId)
        }
      }
    })
  }

  getBlockList(districtId) {
    this.httpService.getBlocksByDistrict(districtId).subscribe(res => {
      if (res.length > 0) {
        console.log(res)
        this.blockList = res;
      }
    })
  }

  sendBasicInfo() {
    if (this.common.studentAction == 'add') {
      if (this.userObj.userType == 'S') {
        this.classMapping.udiseCode = this.userObj.schoolId;
        this.profileDetails.udiseCode = this.userObj.schoolId;
      } else if (this.userObj.userType == 'B') {
        this.profileDetails.udiseCode = this.classMapping.udiseCode;
      }
      this.profileDetails.stateCode = this.common.schoolDetail.stateCode;
      this.profileDetails.districtCode = this.common.schoolDetail.districtCode;
      this.profileDetails.blockCode = this.common.schoolDetail.blockCode;
      this.classMapping.status = 'A';
      this.classMapping.createdBy = this.userObj.userName;

    } else if (this.common.studentAction == 'edit') {
      this.profileDetails.studentId = this.common.stdIdEdit;
    }
    this.requestDTO.studentBasicDetail = this.profileDetails;
    this.requestDTO.classMapping = this.classMapping;
    console.log(this.requestDTO)
    this.saveBasicInfo();
  }

  saveBasicInfo() {
    this.httpService.saveStudentBasicInfo(this.requestDTO).subscribe(res => {
      console.log(res);
      if (res.statusCode == environment.successCode) {
        let basicInfo = res.studentBasicDetail;
        this.common.setGeneratedStdId(basicInfo.recordId);
        this.checkStdClass(this.classMapping.className);
        if (this.common.stdClass < 9) {
          console.log('send empty vocational')
          let vocationalDetail: any = {};
          vocationalDetail.studentId = this.common.generatedStudentId;
          let dto: any = {};
          dto.vocationalDetail = vocationalDetail;
          this.httpService.saveStudentVocationalDetail(dto).subscribe(res1 => {
            console.log(res1)
          })
        }
        if (this.common.studentAction == 'edit') {
          this.getStdBasicInfo();
        }
        this.event.emit();
      } else {
        this.alertMsg = res.description;
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      }
    },
      error => {
        this.alertMsg = "Some problem occurred while saving data. Please try again.";
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      })
  }
}
