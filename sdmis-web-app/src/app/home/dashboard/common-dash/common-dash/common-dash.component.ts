import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-common-dash',
  templateUrl: './common-dash.component.html',
  styleUrls: ['./common-dash.component.css']
})
export class CommonDashComponent implements OnInit {

  @Input() regionType: any;
  @Input() regionCode: any;
  @Output() event = new EventEmitter<any>();
  totalCreated: any = false;
  categoryCount: any = [];
  categoryCreated: any = false;
  managementCreated: any = false;
  mgmtCount: any = [];
  userObj: any = {};

  constructor( private http: HttpService, private common: CommonService ) { }

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    this.getMgmtCatData(this.regionType, this.regionCode);
  }

  getMgmtCatData(regionType, regionCode) {
    this.http.getMgmtCatCount(regionType, regionCode, 'CATEGORY').subscribe(res => {
      console.log(res)
      if(res.statusCode == environment.httpSuccess) {
        this.categoryCount = res.data.result;
        console.log(this.categoryCount)
        this.common.totalSchools = this.categoryCount.reduce(function (a, b) {
          return parseInt(a) + parseInt(b.totalSchools);
        }, 0);
        this.totalCreated = true;
        this.categoryCreated = true;
        this.event.emit();
      }
    })
    this.http.getMgmtCatCount(regionType, regionCode, 'MANAGEMENT').subscribe(res => {
      console.log(res)
      if(res.statusCode == environment.httpSuccess) {
        this.mgmtCount = res.data.result;
        this.managementCreated = true;
      }
    })
  }


}
