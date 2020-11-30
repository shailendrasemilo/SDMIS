import { Component, OnInit } from '@angular/core';
import { MatDrawer } from '@angular/material/sidenav';
import { ActivatedRoute, ActivatedRouteSnapshot, Router } from '@angular/router';
import { CommonService } from '../services/common.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {

  screenWidth: number;

  constructor(private router: Router, public commonService: CommonService) {
    this.screenWidth = window.innerWidth;
    window.onresize = () => {
      // set screenWidth on screen size change
      this.screenWidth = window.innerWidth;
    };
  }

  ngOnInit(): void {
    this.commonService.userObj = JSON.parse(sessionStorage.getItem('user'))
    console.log(this.commonService.userObj)
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
