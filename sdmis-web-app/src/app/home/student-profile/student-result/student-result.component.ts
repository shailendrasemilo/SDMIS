import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-student-result',
  templateUrl: './student-result.component.html',
  styleUrls: ['./student-result.component.css']
})
export class StudentResultComponent implements OnInit {
  @Output() resultEvent = new EventEmitter<any>();
  resultDetail: any = {};
  requestDTO: any = {};
  constructor(public common: CommonService, private http: HttpService) { }

  userObj: any = {};

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    if (this.common.studentAction == 'edit') {
      this.getResultDetail(this.common.stdIdEdit, this.userObj.schoolId);
    }
  }

  getResultDetail(studentId, schoolId) {
    this.http.getResultDetail(studentId, schoolId).subscribe(res => {
      console.log(res)
      if (res.resultDetail) {
        this.resultDetail = res.resultDetail;
      }
    }, error => {
      console.log(error)
    })
  }

  sendResultDetail() {
    this.resultDetail.studentId = this.common.generatedStudentId;
    this.requestDTO.resultDetail = this.resultDetail;
    this.resultEvent.emit(this.requestDTO)
  }

}
