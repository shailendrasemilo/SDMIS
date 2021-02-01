import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-dist-dash',
  templateUrl: './dist-dash.component.html',
  styleUrls: ['./dist-dash.component.css']
})
export class DistDashComponent implements OnInit {

  userObj: any = {};
  distDetails: any = {};
  blockList: any = [];
  tableDataCreated: any = false;
  tableColumn: any = ['name', 'id', 'count'];
  viewDashLevel: any = 'district';
  blockObj: any = [];
  constructor(private common: CommonService, private http: HttpService) { }

  ngOnInit(): void {
  this.userObj = this.common.userObj;
  this.getDistDetails(this.userObj.districtCode)
  this.getBlockList(this.userObj.districtCode)
  }

  getDistDetails(distCode) {
    this.http.getDistDetail(distCode).subscribe(res => {
      console.log(res)
      if(res.statusCode == environment.httpSuccess) {
        this.distDetails = res.data.result;
      }
    })
  }

  getBlockList(distCode) {
    this.http.getBlocksByDistrict(distCode).subscribe(res => {
      console.log(res)
      if(res.statusCode == environment.httpSuccess) {
        this.blockList = new MatTableDataSource(res.data.result);
        this.tableDataCreated = true;
      }
    })
  }

  applyFilter(searchText) {
    this.blockList.filter = searchText.trim().toLowerCase();
  }

  getBlockDash(block) {
    console.log(block);
    this.blockObj = block
    this.viewDashLevel = 'block'
  }

}
