import { Component, EventEmitter, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-student-vocational',
  templateUrl: './student-vocational.component.html',
  styleUrls: ['./student-vocational.component.css']
})
export class StudentVocationalComponent implements OnInit {
  @Output() event = new EventEmitter<any>();
  vocationalDetails: any = {};
  constructor() { }

  ngOnInit(): void {
  }

}
