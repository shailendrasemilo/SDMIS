import { state } from '@angular/animations';
import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';

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
  showProgress: boolean = false;

  constructor(private httpService: HttpService, public common: CommonService) { }

  ngOnInit(): void {
    this.getStateList(); 
    if(this.common.studentAction == 'edit') 
    {
      this.httpService.getStudentById(this.common.stdIdEdit).subscribe(data => {
        console.log(data)
        this.profileDetails = data;
        this.getDistrictList(this.profileDetails.stateId);
      })
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

  getDistrictList(stateId) 
  {
    console.log(stateId)
    this.httpService.getDistrictsByState(stateId).subscribe(res => {
      if(res.length > 0) {
        console.log(res)
        this.districtList = res;
        if(this.common.studentAction =='edit') {
          this.getBlockList(this.profileDetails.districtId)
        }
      }
    })
  }

  getBlockList(districtId) {
    this.httpService.getBlocksByDistrict(districtId).subscribe(res => {
      if(res.length > 0) {
        console.log(res)
        this.blockList = res;
      }
    })
  }

  sendBasicInfo() {
    this.requestDTO.studentBasicDetail = this.profileDetails;
    this.requestDTO.classMapping = this.classMapping;
    this.event.emit(this.requestDTO);
  }

}
