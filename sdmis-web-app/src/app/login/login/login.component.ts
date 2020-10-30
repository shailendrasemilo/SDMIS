import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  defaultUser: any = {'username': 'prerit', 'password': 'Admin@123'};
  user: any = {};
  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;
  constructor( private router: Router, private commonService: CommonService) { }

  ngOnInit() {
    sessionStorage.clear();
  }

  login() {
    console.log(this.user)
    if(this.user.username == this.defaultUser.username && this.user.password) {
      console.log('inside')
      sessionStorage.setItem('user', JSON.stringify(this.user))
      this.router.navigateByUrl('/home/dashboard')
    } else {
      this.alertMsg = "Incorrect Credentials";
      this.alertCount = this.alertCount + 1;
      this.alertFlag = true;
    }
  }

}
