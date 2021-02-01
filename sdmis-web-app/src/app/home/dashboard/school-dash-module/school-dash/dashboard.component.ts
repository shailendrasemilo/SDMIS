import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  viewDashLevel: any;

  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;

  userObj: any = {};
  totalCreated: any = false;
  classWiseCreated: any = false;
  sectionWiseCreated: any = false;
  dashboardData: any = {};

  //api
  totalProfileData: any = {};
  classwiseMaxStd: any = '200'
  profileWiseMaxStd: any = 1000;
  classWiseMst: any = [
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

  classWiseData: any = [];

  profileWiseData: any = [
    { displayText: 'Complete Basic Info' },
    { displayText: 'Complete Education Info' },
    { displayText: 'Complete Incentive Info' },
    { displayText: 'Complete Vocational Info' },
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

  constructor(public common: CommonService, private http: HttpService, private router: Router) {
    console.log('initilized')
  }

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    if ((this.userObj.userType == 'B' || this.userObj.userType == 'D')  && this.common.schoolDetail?.udiseCode) {
      this.viewDashLevel = 'school';
      this.hitSchoolDash(this.common.schoolDetail?.udiseCode);
    } else {
      if (this.userObj.userType == 'S') {
        this.common.schoolDetail = JSON.parse(sessionStorage.getItem('schoolDetail'))
        this.viewDashLevel = 'school';
        this.getSchoolDash(this.userObj.schoolId);
      } else if (this.userObj.userType == 'B') {
        this.viewDashLevel = 'block';
        this.getBlockDash(this.userObj.blockCode);
      } else if (this.userObj.userType == 'D') {
        this.viewDashLevel = 'district';
        this.getDistDash('DISTRICT', this.userObj.districtCode);
      }
    }

  }

  clearDashData() {
    this.totalCreated = false;
    this.sectionWiseCreated = false;
    this.classWiseCreated = false;
  }

  getDistDash(type, distCode) {
    console.log(distCode)
    this.http.getRegionDash(type, distCode).subscribe(res => {
      console.log(res)
      if(environment.successCode == res.statusCode) {
        this.dashboardData = res.dashboardData;
        this.createTotalData();
        this.createSectionWiseData();
        this.createClassWiseData();
      } else {
        this.alertMsg = res.description;
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      }
    })
  }

  getSchoolDash(udiseCode) {
    if (this.userObj.userType == 'B') {
      this.http.getSchoolByUdise(udiseCode).subscribe(res => {
        console.log(res)
        sessionStorage.setItem('schoolDetail', JSON.stringify(res.data.result))
        this.common.schoolDetail = res.data.result
        this.hitSchoolDash(udiseCode)
      })
    } else {
      this.hitSchoolDash(udiseCode)
    }
  }

  hitSchoolDash(udiseCode) {
    this.http.getSchoolDashboard(udiseCode).subscribe(res => {
      console.log(res)
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
    this.http.getBlockEnrollment(blockCode).subscribe(res => {
      console.log(res);
      if (res.statusCode == environment.successCode) {
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
    this.totalCreated = true;
  }

  createClassWiseData() {
    let classArr = this.dashboardData.classesData;
    this.classWiseData = [];
    if ((this.userObj.userType == 'B' && this.viewDashLevel == "block") || (this.userObj.userType == 'D' && this.viewDashLevel == "district")) {
      this.classWiseData = [...this.classWiseMst]
      this.classWiseData.forEach(element => {
        element.count = classArr[element.classNum - 1]
      });
      this.classWiseCreated = true;
    } else if ((this.userObj.userType == 'S' || this.userObj.userType == 'B' || this.userObj.userType == 'D') && this.viewDashLevel == "school") {

      if (this.common.schoolDetail.udiseCode) {
        let schoolObj = this.common.schoolDetail;
        this.classWiseMst.forEach(element => {
          if (element.classNum >= schoolObj.classFrom && element.classNum <= schoolObj.classTo) {
            this.classWiseData.push(element);
          }
          this.classWiseData.forEach(element => {
            element.count = classArr[element.classNum - 1]
          });
          this.classWiseCreated = true;
        });
      }
    }
  }

  createSectionWiseData() {
    let sectionArr = this.dashboardData.sectionWiseData;
    for (let i = 0; i < this.profileWiseData.length; i++) {
      this.profileWiseData[i].count = sectionArr[i]
    }
    this.sectionWiseCreated = true;
  }

  viewStudents(className) {
    console.log(this.common.schoolDetail)
    this.router.navigateByUrl('/home/studentProfile', { state: { className: className, school: this.common.schoolDetail } });
  }
  
  ngOnDestroy() {
    if((this.userObj.userType == 'B' || this.userObj.userType == 'D') && this.common.schoolDetail?.udiseCode) {
      console.log('school found')
      this.common.schoolDetail = {};
    }
  }
}
