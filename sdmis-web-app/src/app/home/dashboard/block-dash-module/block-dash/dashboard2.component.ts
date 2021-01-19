import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-dashboard2',
  templateUrl: './dashboard2.component.html',
  styleUrls: ['./dashboard2.component.css']
})
export class Dashboard2Component implements OnInit {

  @ViewChild(MatPaginator) paginator: MatPaginator;


  totalCreated: any = false;
  genderCreated: any = false;
  socialCatCreated: any = false;
  progressCreated: any = false;
  userObj: any = {};
  blockDetails: any = {};
  totalSchools: any;
  dashboardObj: any = {};
  genderListData: any = {};
  genderChartData: number[];
  progressChartData: number[] = [0, 0];
  genderTotal: any
  genderMst: any = [{ name: 'Boys', index: '0', class: "boy" },
  { name: 'Girls', index: '1', class: 'girl' },
  { name: 'Transgender', index: '2', class: 'trans' }];

  socialCatMst: any = [{ name: 'General', index: '0' },
  { name: 'SC', index: '1' },
  { name: 'ST', index: '2' },
  { name: 'OBC', index: '3' },
  { name: 'ORC', index: '4' },
  { name: 'Others', index: '5' }]

  progressMst: any = [
    { name: 'Schools where student profiles have been added', class: 'green' },
    { name: 'Schools where student profiles have not been added', class: 'red' }
  ]

  socialCatMax: any = 100
  tableDataCreated: any = false;
  tableData: any = []
  tableColumn: any = ['name', 'id', 'cat', 'mgmt', 'range']


  chartOptions = {
    responsive: true,
    cutoutPercentage: 78,
    elements: {
      arc: {
        borderWidth: 5,
      },
    },
    tooltips: { enabled: false },
    hover: { mode: null },
  };

  chartColors: Array<any> = [{ backgroundColor: ['#56C549', '#E93535', '#7c3aab'] }]


  constructor(private http: HttpService, public common: CommonService, private router: Router) { }

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    console.log(this.userObj)
    this.getBlockDetails(this.userObj.blockCode)
    this.getTotalSchoolCount(this.userObj.blockCode);
    this.createTableData(this.userObj.blockCode)
  }

  getBlockDetails(blockCode) {
    this.http.getBlockByBlockCode(blockCode).subscribe(res => {
      console.log(res)
      if(res.statusCode == environment.httpSuccess) {
        this.blockDetails = res.data.result;
      }
    })
  }

  getSchoolProgress(blockCode) {
    this.http.getSchoolProgress(blockCode).subscribe(res => {
      console.log(res);
      if (res.statusCode == environment.successCode) {
        this.progressMst[0].count = parseInt(res.schoolCount)
        this.progressMst[1].count = parseInt(this.totalSchools) - parseInt(res.schoolCount);
        this.progressChartData[0] = parseInt(res.schoolCount)
        this.progressChartData[1] = parseInt(this.totalSchools) - parseInt(res.schoolCount);
        this.progressCreated = true;
      } else {

      }
    })
  }

  createTableData(blockCode) {
    this.http.getAllSchoolByBlock(blockCode, 1, 1).subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.httpSuccess) {
        this.http.getAllSchoolByBlock(blockCode, 1, res.data.totalSize).subscribe(res2 => {
          console.log(res2)
          if (res2.statusCode == environment.httpSuccess) {
            this.tableData = res2.data.result;
            this.tableData = new MatTableDataSource(this.tableData);
            setTimeout(() => {
              this.tableData.paginator = this.paginator;
            }, 1)
            this.tableDataCreated = true;
          }
        })
      }
    })
  }

  getTotalSchoolCount(blockCode) {
    this.http.getAllSchoolByBlock(blockCode, 1, 1).subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.httpSuccess) {
        this.totalSchools = res.data.totalSize;
        this.totalCreated = true
        this.getSchoolProgress(blockCode);
      }
    })
  }

  getGenderCatData(blockCode) {
    this.http.getBlockMoreDashboard(blockCode).subscribe(res => {
      console.log(res);
      if (res.statusCode == environment.successCode) {
        this.dashboardObj = res.dashboardData;
        this.createGenderData(this.dashboardObj.genderWiseData);
        this.createSocialCatData(this.dashboardObj.socialCatData)
      } else {

      }
    })
  }

  createGenderData(genderList) {
    this.genderChartData = genderList
    for (let i = 0; i < this.genderMst.length; i++) {
      this.genderMst[i].count = genderList[i]
    }
    this.genderTotal = genderList.reduce(function (a, b) {
      return parseInt(a) + parseInt(b);
    }, 0);

    console.log(this.genderMst)
    this.genderCreated = true;
  }

  createSocialCatData(socialCatList) {
    this.socialCatMst.forEach(element => {
      element.count = socialCatList[element.index]
    });
    this.socialCatCreated = true;
  }

  applyFilter(searchText) {
    this.tableData.filter = searchText.trim().toLowerCase();
  }

  schoolEnrollment(school) {
    console.log(school)
    this.common.schoolDetail = school;
    this.router.navigate(['/home/dashboard/1'])
  }

}
