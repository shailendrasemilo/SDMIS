import { Component, OnInit } from '@angular/core';
import { Color } from 'ng2-charts';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

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
  chartMasterData: any = [{ name: 'Completed Profile', class: 'complete', var: 'completeProfile' }, { name: 'Remaining Profile', class: 'remaining', var: 'remainingProfile' }];
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
    this.http.getDashboard(this.userObj.schoolId).subscribe(res => {
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

    this.chartMasterData.forEach(element => {
      if (profileDataKeys.includes(element.var)) {
        element.count = this.totalProfileData[element.var]
      }
    });
    console.log(this.chartMasterData);
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

}
