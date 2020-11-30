import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';

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
    this.vocationalEvent.emit(this.requestDTO)
  }

}
