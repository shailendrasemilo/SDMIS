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
    { 'username': 'preritSchool1', 'password': 'Admin@123', 'schoolId': '16030600201', userType: 'S', name: 'Prerit School 1', designation: 'Teacher' },
    { 'username': 'preritSchool2', 'password': 'Admin@123', 'schoolId': '16030600202', userType: 'S', name: 'Prerit School 2', designation: 'Teacher' },
    { 'username': 'preritBlock', 'password': 'Admin@123', 'blockCode': '160306', userType: 'B', name: 'Prerit Block', designation: 'Block User' }
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
        this.router.navigateByUrl('/home/dashboard')
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
