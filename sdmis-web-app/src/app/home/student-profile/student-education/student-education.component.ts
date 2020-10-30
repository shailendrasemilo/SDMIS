import { Component, EventEmitter, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-student-education',
  templateUrl: './student-education.component.html',
  styleUrls: ['./student-education.component.css']
})
export class StudentEducationComponent implements OnInit {
  @Output() educationEvent = new EventEmitter<any>();
  educationDetails: any = {};
  constructor() { }

  ngOnInit(): void {
  }

  sendEducationInfo() {
    this.educationEvent.emit(this.educationDetails);
  }

}
