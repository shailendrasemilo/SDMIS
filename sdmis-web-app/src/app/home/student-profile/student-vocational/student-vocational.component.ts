import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-student-vocational',
  templateUrl: './student-vocational.component.html',
  styleUrls: ['./student-vocational.component.css']
})
export class StudentVocationalComponent implements OnInit {
  @Output() vocationalEvent = new EventEmitter<any>();
  vocationalDetail: any = {};
  requestDTO: any = {};
  constructor(public common: CommonService, private http: HttpService) { }

  userObj: any = {};
  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    if (this.common.studentAction == 'edit') {
      this.getVocationDetail(this.common.stdIdEdit, this.userObj.schoolId);
    }
  }

  getVocationDetail(studentId, schoolId) {
    this.http.getVocationDetail(studentId, schoolId).subscribe(res => {
      console.log(res)
      if (res.vocationalDetail) {
        this.vocationalDetail = res.vocationalDetail;
      }
    }, error => {
      console.log(error)
    })
  }
  sendVocationalDetail() {
    this.vocationalDetail.studentId = this.common.generatedStudentId;
    this.requestDTO.vocationalDetail = this.vocationalDetail;
    this.saveVocationalInfo();
  }

  saveVocationalInfo() {
    this.http.saveStudentVocationalDetail(this.requestDTO).subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.successCode) {
        if (this.common.studentAction == 'add') {
          this.vocationalEvent.emit()

        } else if (this.common.studentAction == 'edit') {
          this.alertMsg = 'Data updated successfully.';
          this.alertCount = this.alertCount + 1;
          this.alertFlag = true;
          this.getVocationDetail(this.common.stdIdEdit, this.userObj.schoolId);

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

