import { HttpClient } from '@angular/common/http';
import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-student-incentive',
  templateUrl: './student-incentive.component.html',
  styleUrls: ['./student-incentive.component.css']
})
export class StudentIncentiveComponent implements OnInit {
  @Output() incentiveEvent = new EventEmitter<any>();
  incentiveDetail: any = {};
  requestDTO: any = {};
  constructor(public common: CommonService, private http: HttpService) { }
  userObj: any = {};

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    if (this.common.studentAction == 'edit') {
      this.getIncentiveDetail(this.common.stdIdEdit, this.userObj.schoolId);
    }
  }

  sendIncentiveDetail() {
    this.incentiveDetail.studentId = this.common.generatedStudentId;
    this.requestDTO.incentiveDetail = this.incentiveDetail;
    this.incentiveEvent.emit(this.requestDTO);
  }

  getIncentiveDetail(studentId, schoolId) {
    this.http.getIncentiveDetail(studentId, schoolId).subscribe(res => {
      console.log(res)
      if (res.incentiveDetail) {
        this.incentiveDetail = res.incentiveDetail;
      }
      console.log(this.incentiveDetail)
    }, error => {
      console.log(error)
    })
  }

}
