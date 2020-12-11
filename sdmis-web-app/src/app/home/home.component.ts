import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { MatDrawer } from '@angular/material/sidenav';
import { ActivatedRoute, ActivatedRouteSnapshot, Router } from '@angular/router';
import { environment } from 'src/environments/environment';
import { CommonService } from '../services/common.service';
import { HttpService } from '../services/http.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {

  screenWidth: number;

  constructor(public commonService: CommonService, private http: HttpService) {
    this.screenWidth = window.innerWidth;
    window.onresize = () => {
      this.screenWidth = window.innerWidth;
    };
  }

  ngOnInit(): void {
    console.log('inside')
    this.commonService.userObj = JSON.parse(sessionStorage.getItem('user'))
    if (this.commonService.userObj.userType == 'S') {
      this.commonService.getSchoolData();
    }
  }

  toggleDrawer(drawer: MatDrawer) {
    if (this.commonService.sidenavOpen) {
      this.commonService.sidenavOpen = false
    } else {
      this.commonService.sidenavOpen = true;
    }

    console.log(this.commonService.sidenavOpen)
  }



}
