import { Component, OnInit } from '@angular/core';
import { CommonService } from '../services/common.service'

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit {

  constructor(private commonService: CommonService) { }

  ngOnInit(): void {
  }

  setRoute(routeName) {
    this.commonService.setCurrentRoute(routeName);
  }

}
