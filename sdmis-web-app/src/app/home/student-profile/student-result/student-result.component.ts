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

  resultList: any = [
    { name: "Promoted", value: 1 },
    { name: "Repeater", value: 2 },
    { name: "Discontinued", value: 3 },
    { name: "New admission in current year", value: 4 }]

  schoolingStatus: any = [{ name: "Continuing in the school", value: "1" }, { name: "Left the school with Transfer Certificate", value: "2" }]

  streamList: any = [{ name: "Not Applicable", value: "0" }, { name: "Arts", value: "1" }, { name: "Science", value: "2" }, { name: "Commerce", value: "3" }, { name: "Vocational", value: "4" }, { name: "Other", value: "5" }];

  constructor(public common: CommonService, private http: HttpService) { }

  userObj: any = {};
  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    if (this.common.studentAction == 'edit') {
      this.getResultDetail(this.common.stdIdEdit, this.common.schoolDetail.udiseCode);
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
    if (this.common.studentAction == 'add') {
      this.resultDetail.studentId = this.common.generatedStudentId;
    }
    else if (this.common.studentAction == 'edit') {
      this.resultDetail.studentId = this.common.stdIdEdit;
    }
    this.requestDTO.resultDetail = this.resultDetail;
    this.saveResultInfo();
  }

  saveResultInfo() {
    this.http.saveStudentResultDetail(this.requestDTO).subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.successCode) {
        if (this.common.studentAction == 'edit') {
          this.getResultDetail(this.common.stdIdEdit, this.common.schoolDetail.udiseCode);
        }
        this.resultEvent.emit()

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

