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

  tradeList: any = []
  jobRole: any = []
  nsqfLevels: any = [{ name: "Level 1", value: 1}, { name: "Level 2", value: 2}, { name: "Level 3", value: 3}, { name: "Level 4", value: 4}]
  stdOptFor: any = [{ name: "Opted for Placement", value: "1"}, { name: "Opted for Higher/Secondary Education in vocational Field", value: "2"}, { name: "Opted for Higher Education in Field other than vocational Field", value: "3"}]
  
  employmentStatus: any = [{ name: "Got Placement", value: 1}, { name: "Did not get placed", value: 2}, { name: "Self employed", value: 3}]
  salaryList: any = [{ name: "Less than Rs. 5000", value: 1}, { name: "Rs. 5000 to Rs. 9999", value: 2}, { name: "Rs. 10,000 or above", value: 3}]

  constructor(public common: CommonService, private http: HttpService) { }

  userObj: any = {};
  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    this.getMasters();
    if (this.common.studentAction == 'edit') {
      this.getVocationDetail(this.common.stdIdEdit, this.common.schoolDetail.udiseCode);
    }
  }

  getMasters() {
    this.getJobRole();
    this.getTradeList();
  }

  getJobRole() {
    this.http.getJobRole().subscribe(res => {
      console.log('job role', res)
      if(res.statusCode == environment.httpSuccess) {
        this.jobRole = res.data.result
      }
    })
  }

  getTradeList() {
    this.http.getTradeList().subscribe(res => {
      console.log('trade list', res)
      if(res.statusCode == environment.httpSuccess) {
        this.tradeList = res.data.result
      }
    }) 
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
    if (this.common.studentAction == 'add') {
      this.vocationalDetail.studentId = this.common.generatedStudentId;
    }
    else if (this.common.studentAction == 'edit') {
      this.vocationalDetail.studentId = this.common.stdIdEdit;
    }
    this.requestDTO.vocationalDetail = this.vocationalDetail;
    this.saveVocationalInfo();
  }

  saveVocationalInfo() {
    this.http.saveStudentVocationalDetail(this.requestDTO).subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.successCode) {
        if (this.common.studentAction == 'edit') {
          this.getVocationDetail(this.common.stdIdEdit, this.common.schoolDetail.udiseCode);
        }
        this.vocationalEvent.emit()

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

