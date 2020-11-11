import { Component, OnInit, ViewChild } from '@angular/core';
import { MatStepper } from '@angular/material/stepper';
import { environment } from 'src/environments/environment';
import { HttpService } from '../../../services/http.service';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { CommonService } from 'src/app/services/common.service';

@Component({
  selector: 'app-student-profile',
  templateUrl: './student-profile.component.html',
  styleUrls: ['./student-profile.component.css'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})
export class StudentProfileComponent implements OnInit {

  @ViewChild("stepper") stepper: MatStepper;
  requestDto: any = {};
  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;
  studentAction: String = 'view';
  basicInfoList: any = [];
  basicInfoTableHead = ['name', 'admissionNum', 'dob', 'doa', 'gender'];
  showProgress: boolean = false;

  constructor(private httpService: HttpService, public common: CommonService) { }

  ngOnInit(): void {
    this.getStudentList();
  }

  getStudentList() {
    this.studentAction = 'view';
    this.httpService.getStudents().subscribe(data => {
      if (data.length > 0) {
        this.basicInfoList = data;
        console.log(this.basicInfoList)
      } else {
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
        this.alertMsg = 'Student Records Found';
      }
    }, error => {
      this.alertCount = this.alertCount + 1;
      this.alertFlag = true;
      this.alertMsg = 'Some error occured';
    })
  }

  receiveBasicInfoData(event) {
    this.requestDto = event;
    console.log(this.requestDto)
    this.httpService.saveStudentBasicInfo(this.requestDto).subscribe(res => {
      console.log(res);
      if (res.statusCode == environment.successCode) {
        this.moveStepper();
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

  moveStepper() {
    this.stepper.selected.completed = true;
    this.stepper.next();
  }


  receiveEducationInfo(event) {
    console.log(event);
    this.stepper.next();
  }

}
