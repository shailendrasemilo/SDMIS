import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  @ViewChild(MatPaginator) paginator: MatPaginator;

  viewDashLevel: any;

  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;

  userObj: any = {};
  totalCreated: any = false;
  classWiseCreated: any = false;
  sectionWiseCreated: any = false;
  tableDataCreated: any = false;
  dashboardData: any = {};
  tableColumn: any = ['name', 'id']
  tableData: any = []

  //api
  totalProfileData: any = {};
  classwiseMaxStd: any = '200'
  profileWiseMaxStd: any = 1000;
  classWiseData: any = [
    { classRoman: 'I', classNum: 1 },
    { classRoman: 'II', classNum: 2 },
    { classRoman: 'III', classNum: 3 },
    { classRoman: 'IV', classNum: 4 },
    { classRoman: 'V', classNum: 5 },
    { classRoman: 'VI', classNum: 6 },
    { classRoman: 'VII', classNum: 7 },
    { classRoman: 'VIII', classNum: 8 },
    { classRoman: 'IX', classNum: 9 },
    { classRoman: 'X', classNum: 10 },
    { classRoman: 'XI', classNum: 11 },
    { classRoman: 'XII', classNum: 12 }
  ]

  profileWiseData: any = [
    { displayText: 'Complete Basic Info' },
    { displayText: 'Complete Education Info' },
    { displayText: 'Complete Vocational Info' },
    { displayText: 'Complete Incentive Info' },
    { displayText: 'Complete Result Info' },
  ]

  //calculate
  profileSum: any;

  //default
  //element var is the key value of totalProfileData object
  schoolChartMasterData: any = [{ name: 'Completed Profile', class: 'complete', var: 'completeProfile' }, { name: 'Remaining Profile', class: 'remaining', var: 'remainingProfile' }];
  chartColors: Array<any> = [{ backgroundColor: ['#56C549', '#E93535'] }]

  doughnutChartLabels: string[];
  doughnutChartData: number[]

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

  constructor(private common: CommonService, private http: HttpService) {
    console.log('initilized')
  }

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    console.log(this.userObj)
    if (this.userObj.userType == 'S') {
      this.viewDashLevel = 'school';
      this.getSchoolDash(this.userObj.schoolId);
    } else if (this.userObj.userType == 'B') {
      this.viewDashLevel = 'block';
      this.getBlockDash(this.userObj.blockCode);
    }

  }

  applyFilter(searchText) {
    console.log(searchText)
    this.tableData.filter = searchText.trim().toLowerCase();
  }

  clearDashData() {
    this.totalCreated = false;
    this.sectionWiseCreated = false;
    this.classWiseCreated = false;
    this.tableDataCreated = false;
  }

  getSchoolDash(udiseCode) {
    this.http.getSchoolDashboard(udiseCode).subscribe(res => {
      console.log(res);
      if (res.statusCode == environment.successCode) {
        this.clearDashData();
        this.viewDashLevel = 'school';
        this.dashboardData = res.dashboardData;
        this.createTotalData();
        this.createClassWiseData();
        this.createSectionWiseData();
      } else {
        this.alertMsg = res.description;
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      }

    })
  }

  getBlockDash(blockCode) {
    this.http.getBlockDashboard(blockCode).subscribe(res => {
      console.log(res);
      if (res.statusCode == environment.successCode) {
        this.dashboardData = res.dashboardData;
        this.createTotalData();
        this.createClassWiseData();
        this.createSectionWiseData();
        this.createTableData(blockCode);
      } else {
        this.alertMsg = res.description;
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      }

    })
  }

  createTableData(blockCode) {
    if (this.viewDashLevel == 'block') {
      this.http.getAllSchoolByBlock(blockCode, 1, 1).subscribe(res => {
        console.log(res)
        if (res.statusCode == environment.httpSuccess) {
          this.http.getAllSchoolByBlock(blockCode, 1, res.data.totalSize).subscribe(res2 => {
            console.log(res2)
            if (res.statusCode == environment.httpSuccess) {
              this.tableData = res2.data.result;
              this.tableData = new MatTableDataSource(this.tableData);
              setTimeout(() => {
                this.tableData.paginator = this.paginator;
              }, 100)
              this.tableDataCreated = true;
            }
          })
        } else {
          this.alertMsg = res.statusMessage;
          this.alertCount = this.alertCount + 1;
          this.alertFlag = true;
        }
      })
    }
  }

  createTotalData() {
    this.totalProfileData.completeProfile = this.dashboardData.completeProfile;
    this.totalProfileData.remainingProfile = this.dashboardData.remainingProfile;
    let profileValues: any[] = Object.values(this.totalProfileData);
    let profileDataKeys = Object.keys(this.totalProfileData);

    this.doughnutChartData = profileValues;

    this.profileSum = profileValues.reduce(function (a, b) {
      return parseInt(a) + parseInt(b);
    }, 0);

    this.schoolChartMasterData.forEach(element => {
      if (profileDataKeys.includes(element.var)) {
        element.count = this.totalProfileData[element.var]
      }
    });
    console.log(this.schoolChartMasterData);
    this.totalCreated = true;
  }

  createClassWiseData() {
    let classArr = this.dashboardData.classesData;
    this.classWiseData.forEach(element => {
      element.count = classArr[element.classNum - 1]
    });
    console.log(this.classWiseData)
    this.classWiseCreated = true;
  }

  createSectionWiseData() {
    let sectionArr = this.dashboardData.sectionWiseData;
    for (let i = 0; i < this.profileWiseData.length; i++) {
      this.profileWiseData[i].count = sectionArr[i]
    }
    this.sectionWiseCreated = true;
  }

  originalDash() {
    if (this.userObj.userType = 'B') {
      this.viewDashLevel = 'block';
      this.getBlockDash(this.userObj.blockCode)
    }
  }
}
