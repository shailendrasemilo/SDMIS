import { Component, OnInit, ViewChild } from '@angular/core';
import { MatStepper } from '@angular/material/stepper';

@Component({
  selector: 'app-student-profile',
  templateUrl: './student-profile.component.html',
  styleUrls: ['./student-profile.component.css']
})
export class StudentProfileComponent implements OnInit {
  
  @ViewChild("stepper") stepper: MatStepper;

  constructor() { }

  ngOnInit(): void {
  }

  eventGet(stepper) {
    console.log(stepper)
    stepper.next();
  }

  receiveBasicInfoData(event) {
    console.log(event)
    this.stepper.next();
  }

}
