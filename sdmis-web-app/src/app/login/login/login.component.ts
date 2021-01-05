import { HttpClient } from '@angular/common/http';
import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { Router } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class LoginComponent implements OnInit {

  defaultUser: any = [
    { 'username': 'preritSchool1', 'password': 'Admin@123', 'schoolId': '16050503009', userType: 'S', name: 'Prerit School 1', designation: 'Teacher' },
    { 'username': 'preritSchool2', 'password': 'Admin@123', 'schoolId': '16010300709', userType: 'S', name: 'Prerit School 2', designation: 'Teacher' },
    { 'username': 'preritSchool3', 'password': 'Admin@123', 'schoolId': '16040900120', userType: 'S', name: 'Prerit School 3', designation: 'Teacher' },
    { 'username': 'preritBlock1', 'password': 'Admin@123', 'blockCode': '160505', userType: 'B', name: 'Prerit Block', designation: 'Block User 1' },
    { 'username': 'preritBlock2', 'password': 'Admin@123', 'blockCode': '160103', userType: 'B', name: 'Prerit Block', designation: 'Block User 3' },
    { 'username': 'preritBlock3', 'password': 'Admin@123', 'blockCode': '160409', userType: 'B', name: 'Prerit Block', designation: 'Block User 2' },
  ];


  user: any = {};
  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;
  constructor(private router: Router, private commonService: CommonService, private http: HttpService) { }

  ngOnInit() {
    sessionStorage.clear();

  }

  login() {
    let login = false;
    console.log(this.user)
    this.defaultUser.forEach(element => {
      console.log(element)
      if (this.user.username == element.username && this.user.password == element.password) {
        console.log('inside')
        sessionStorage.setItem('user', JSON.stringify(element))
        if (element.userType == 'S') {
          this.http.getSchoolByUdise(element.schoolId).subscribe(res => {
            console.log(res)
            sessionStorage.setItem('schoolDetail', JSON.stringify(res.data.result))
            this.commonService.schoolMgmt = res.data.result.schoolManagementState;
            this.router.navigateByUrl('/home/dashboard/1')

          })
        }
        else if (element.userType == 'B') {
          this.router.navigateByUrl('/home/dashboard/2')
        }
        login = true;
      }
    });
    if (!login) {
      this.alertMsg = "Incorrect Credentials";
      this.alertCount = this.alertCount + 1;
      this.alertFlag = true;;
    }


  }



}
