import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

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
  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;

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
    this.saveResultInfo();
  }

  saveResultInfo() {
    this.http.saveStudentResultDetail(this.requestDTO).subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.successCode) {
        if (this.common.studentAction == 'add') {
          this.resultEvent.emit()
        } else if (this.common.studentAction == 'edit') {
          this.alertMsg = "Data updated successfully.";
          this.alertCount = this.alertCount + 1;
          this.alertFlag = true;
          this.getResultDetail(this.common.stdIdEdit, this.userObj.schoolId);
        }
      } else {
        this.alertMsg = res.description;
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      }
    }, error => {
      this.alertMsg = "Some problem occurred while saving data. Please try again.";
      this.alertCount = this.alertCount + 1;
      this.alertFlag = true;
    })
  }
}

