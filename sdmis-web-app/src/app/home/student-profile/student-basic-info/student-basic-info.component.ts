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
  disabilityList: any = [];
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
    this.common.schoolDetail = JSON.parse(sessionStorage.getItem('schoolDetail'))
    console.log(this.common.schoolDetail)
    this.getStateList();
    this.getMasterData();
    this.userObj = this.common.userObj;
    if (this.common.studentAction == 'edit') {
      this.getStdBasicInfo();
    } else if (this.common.studentAction == 'add') {
      this.classMapping.className = this.common.stdForClass
      this.classMapping.udiseCode = this.common.schoolDetail.udiseCode
      this.getSectionList(this.classMapping.className)
      this.setSchoolLocData();
    }
  }

  setSchoolLocData() {
    this.profileDetails.stateCode = this.common.schoolDetail.stateCode
    this.profileDetails.districtCode = this.common.schoolDetail.districtCode;
    this.profileDetails.blockCode = this.common.schoolDetail.blockCode;
    this.classMapping.stateCode = this.common.schoolDetail.stateCode
    this.classMapping.districtCode = this.common.schoolDetail.districtCode;
    this.classMapping.blockCode = this.common.schoolDetail.blockCode;
  }

  getClassBySchoolRange(school) {
    this.common.schoolDetail = school;
    this.setSchoolLocData();
    this.classList = this.common.createSchoolClassList(school.classFrom, school.classTo);
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
    this.getDisabilityList();
  }

  getDisabilityList() {
    this.httpService.getDisability().subscribe(res => {
      console.log('disability', res)
      if (res.statusCode == environment.httpSuccess) {
        this.disabilityList = res.data.result;
      } else {
        console.log('error')
      }
    }, error => {
      console.log(error)

    })
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
      if (res.statusCode == environment.httpSuccess && res.data.result.length > 0) {
        this.stateList = res.data.result;
        console.log(this.stateList)
      }
    }, error => {
      console.log(error)
    })
  }

  checkStdClass(className) {
    console.log(className)
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
    udiseCode = this.common.schoolDetail.udiseCode
    // if (this.userObj.userType == 'S') {
    //   udiseCode = this.common.schoolDetail.udiseCode
    // } else if (this.userObj.userType == 'B') {
    //   udiseCode = this.classMapping.udiseCode;
    // }
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
    // this.getClassBySchoolRange(this.common.schoolDetail)
    this.httpService.getStudentBasicInfoById(this.common.stdIdEdit, this.common.schoolDetail.udiseCode).subscribe(data => {
      console.log(data)
      if (data.studentBasicDetail) {
        this.profileDetails = data.studentBasicDetail;
        this.profileDetails.dob = new Date(this.profileDetails.dob)
        this.profileDetails.doa = new Date(this.profileDetails.doa)
      } if (data.sectionClassMapping) {
        this.classMapping = data.sectionClassMapping;
        // this.checkStdClass(this.classMapping.className)
      }
      this.getDistrictList(this.profileDetails.stateId);
      this.getSectionList(this.classMapping.className)
      this.getMasterData()
    })
  }

  getDistrictList(stateId) {
    console.log(stateId)
    this.httpService.getDistrictsByState(stateId).subscribe(res => {
      if (res.statusCode == environment.httpSuccess && res.data.result.length > 0) {
        console.log(res)
        this.districtList = res.data.result;
      } else {
        this.alertMsg = "No Districts Found";
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      }
    })
  }

  sendBasicInfo() {
    if (this.common.studentAction == 'add') {
      this.profileDetails.udiseCode = this.common.schoolDetail.udiseCode;
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
