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
    { 'username': '16010300101', 'password': 'Admin@123', 'schoolId': '16010300101', userType: 'S', name: 'Prerit Mathur - 16010300101', designation: 'Teacher' },
    { 'username': '16010300709', 'password': 'Admin@123', 'schoolId': '16010300709', userType: 'S', name: 'Prerit Mathur - 16010300709', designation: 'Teacher' },
    { 'username': '16010300701', 'password': 'Admin@123', 'schoolId': '16010300701', userType: 'S', name: 'Prerit Mathur - 16010300701', designation: 'Teacher' },
    { 'username': '160103', 'password': 'Admin@123', 'blockCode': '160103', userType: 'B', name: 'Prerit Mathur - 160103', designation: 'Block User' },
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
    this.defaultUser.forEach(element => {
      if (this.user.username == element.username && this.user.password == element.password) {
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
