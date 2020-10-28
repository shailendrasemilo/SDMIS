import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, ActivatedRouteSnapshot, Router } from '@angular/router';
import { CommonService } from '../services/common.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {

  constructor( private router: Router, public commonService: CommonService) { }

  ngOnInit(): void {
    
  }

  logout() {
    sessionStorage.clear();
    this.router.navigate(['./login'])
  }

}
