import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';

@Component({
  selector: 'app-student-vocational',
  templateUrl: './student-vocational.component.html',
  styleUrls: ['./student-vocational.component.css']
})
export class StudentVocationalComponent implements OnInit {
  @Output() vocationalEvent = new EventEmitter<any>();
  vocationalDetail: any = {};
  requestDTO: any = {};
  constructor(private common: CommonService) { }

  ngOnInit(): void {
  }

  sendVocationalDetail() {
    this.vocationalDetail.student_id = this.common.generatedStudentId;
    this.requestDTO.vocationalDetail = this.vocationalDetail;
    this.vocationalEvent.emit(this.requestDTO)
  }

}
