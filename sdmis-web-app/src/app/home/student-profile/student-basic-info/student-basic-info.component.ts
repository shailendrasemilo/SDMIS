import { Component, EventEmitter, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-student-basic-info',
  templateUrl: './student-basic-info.component.html',
  styleUrls: ['./student-basic-info.component.css']
})
export class StudentBasicInfoComponent implements OnInit {
  
  @Output() event = new EventEmitter<any>();
  profileDetails: any = {};

  constructor() { }

  ngOnInit(): void {
  }

  sendBasicInfo() {
    this.event.emit(this.profileDetails);
  }

}
