import { Component, OnInit, ViewChild } from '@angular/core';
import { MatStepper } from '@angular/material/stepper';
import { environment } from 'src/environments/environment';
import { HttpService } from '../../../services/http.service'

@Component({
  selector: 'app-student-profile',
  templateUrl: './student-profile.component.html',
  styleUrls: ['./student-profile.component.css']
})
export class StudentProfileComponent implements OnInit {

  @ViewChild("stepper") stepper: MatStepper;
  requestDto: any = {};
  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;

  constructor( private httpService: HttpService) { }

  ngOnInit(): void {
  }

  receiveBasicInfoData(event) {
    this.requestDto = event;
    console.log(this.requestDto)
    this.httpService.saveStudentBasicInfo(this.requestDto).subscribe(res => {
      console.log(res);
      if(res.statusCode == environment.successCode) {
        this.stepper.next();
      } else {
        this.alertMsg = res.description;
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      }
    },
      error => {
        this.alertMsg = "Some problem occurred while saving data. Please try again.";
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      })

  }



  receiveEducationInfo(event) {
    console.log(event);
    this.stepper.next();
  }

}
