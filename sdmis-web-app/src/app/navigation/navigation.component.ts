import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CommonService } from '../services/common.service'

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit {

  constructor(public commonService: CommonService, private router: Router) { }
  userObj: any = {};
  ngOnInit(): void {
    this.userObj = this.commonService.userObj
  }

  logout() {
    sessionStorage.clear();
    this.router.navigate(['./login'])
  }

}
