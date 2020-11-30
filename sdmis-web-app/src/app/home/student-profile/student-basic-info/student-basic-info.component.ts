import { state } from '@angular/animations';
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

  religionList: any = [{ name: 'Hindu', id: 1 }, { name: 'Muslim', id: 2 }, { name: 'Sikh', id: 3 }];
  motherTongueList: any = [{ name: 'Hindi', id: 1 }, { name: 'English', id: 2 }];
  socialCategoryList: any = [{ name: 'General', id: 1 }, { name: 'SC/ST', id: 2 }];
  classList: any = [{ name: 'Class I', id: 1 }, { name: 'Class II', id: 2 }];
  sectionList: any = [{ name: 'Section A', id: 1 }, { name: 'Section B', id: 2 }];

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
    this.userObj = this.common.userObj
    if (this.common.studentAction == 'edit') {
      this.getStdBasicInfo();
    }

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

  getStdBasicInfo() {
    this.httpService.getStudentBasicInfoById(this.common.stdIdEdit, this.userObj.schoolId).subscribe(data => {
      console.log(data)
      if (data.studentBasicDetail) {
        this.profileDetails = data.studentBasicDetail;
        this.profileDetails.dob = new Date(this.profileDetails.dob)
        this.profileDetails.doa = new Date(this.profileDetails.doa)
      } if (data.sectionClassMapping) {
        this.classMapping = data.sectionClassMapping;
      }

      this.getDistrictList(this.profileDetails.stateId);
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
      let userObj = this.common.userObj
      this.classMapping.schoolId = userObj.schoolId;
      this.classMapping.status = 'A';
      this.classMapping.createdBy = userObj.userName;
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
        if (this.common.studentAction == 'add') {
          this.event.emit();
        } else if (this.common.studentAction == 'edit') {
          this.alertMsg = 'Data updated successfully.';
          this.alertCount = this.alertCount + 1;
          this.alertFlag = true;
          this.getStdBasicInfo();
        }
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
