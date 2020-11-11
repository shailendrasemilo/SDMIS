import { Component, EventEmitter, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-student-incentive',
  templateUrl: './student-incentive.component.html',
  styleUrls: ['./student-incentive.component.css']
})
export class StudentIncentiveComponent implements OnInit {
  @Output() event = new EventEmitter<any>();
  incentiveDetails: any = {};

  constructor() { }

  ngOnInit(): void {
  }

}
