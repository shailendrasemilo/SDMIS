import { Component, EventEmitter, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-student-result',
  templateUrl: './student-result.component.html',
  styleUrls: ['./student-result.component.css']
})
export class StudentResultComponent implements OnInit {
  @Output() event = new EventEmitter<any>();
  resultDetails: any = {};
  constructor() { }

  ngOnInit(): void {
  }

}
