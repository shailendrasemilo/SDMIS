import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-student-education',
  templateUrl: './student-education.component.html',
  styleUrls: ['./student-education.component.css']
})
export class StudentEducationComponent implements OnInit {
  @Output() educationEvent = new EventEmitter<any>();
  educationDetail: any = {};
  requestDto: any = {};
  classList: any = [{ name: 'Class I', id: 1 }, { name: 'Class II', id: 2 }];
  moiList: any = [{ name: 'Hindi', id: 1 }, { name: 'English', id: 2 }];
  userObj: any = {};

  constructor(public common: CommonService, private http: HttpService) { }

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    if (this.common.studentAction == 'edit') {
      this.getEducationDetail(this.common.stdIdEdit, this.userObj.schoolId);
    }
  }

  sendEducationInfo() {
    this.educationDetail.studentId = this.common.generatedStudentId;
    this.requestDto.educationDetail = this.educationDetail
    this.educationEvent.emit(this.requestDto);
  }

  getEducationDetail(studentId, schoolId) {
    this.http.getEducationDetail(studentId, schoolId).subscribe(res => {
      console.log(res)
      if (res.educationDetail) {
        this.educationDetail = res.educationDetail;
      }
    }, error => {
      console.log(error)
    })
  }

}
