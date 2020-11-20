import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';

@Component({
  selector: 'app-student-incentive',
  templateUrl: './student-incentive.component.html',
  styleUrls: ['./student-incentive.component.css']
})
export class StudentIncentiveComponent implements OnInit {
  @Output() incentiveEvent = new EventEmitter<any>();
  incentiveDetail: any = {};
  requestDTO: any = {};
  constructor(private common: CommonService) { }

  ngOnInit(): void {
  }

  sendIncentiveDetail() {
    this.incentiveDetail.student_id = this.common.generatedStudentId;
    this.requestDTO.incentiveDetail = this.incentiveDetail;
    this.incentiveEvent.emit(this.requestDTO);

  }

}
