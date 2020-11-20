import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';

@Component({
  selector: 'app-student-result',
  templateUrl: './student-result.component.html',
  styleUrls: ['./student-result.component.css']
})
export class StudentResultComponent implements OnInit {
  @Output() resultEvent = new EventEmitter<any>();
  resultDetail: any = {};
  requestDTO: any = {};
  constructor( private common: CommonService) { }

  ngOnInit(): void {
  }

  sendResultDetail() {
    this.resultDetail.student_id = this.common.generatedStudentId;
    this.requestDTO.incentiveDetail = this.resultDetail;
    this.resultEvent.emit(this.requestDTO)
  }

}
