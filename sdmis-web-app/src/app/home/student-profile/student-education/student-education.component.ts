import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';

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
  constructor( private common: CommonService ) { }

  ngOnInit(): void {
  }

  sendEducationInfo() {
    this.educationDetail.studentId = this.common.generatedStudentId;
    this.requestDto.educationDetail = this.educationDetail
    this.educationEvent.emit(this.requestDto);
  }

}
