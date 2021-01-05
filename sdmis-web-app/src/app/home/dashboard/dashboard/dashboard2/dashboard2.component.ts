import { Component, OnInit } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-dashboard2',
  templateUrl: './dashboard2.component.html',
  styleUrls: ['./dashboard2.component.css']
})
export class Dashboard2Component implements OnInit {
  totalCreated: any = false;
  genderCreated: any = false;
  socialCatCreated: any = false;
  userObj: any = {};
  totalSchools: any;
  genderListData: any = {};
  genderChartData: number[];
  genderTotal: any
  genderMst: any = [{ name: 'Boys', index: '0', class:"boy" },
  { name: 'Girls', index: '1', class:'girl' },
  { name: 'Transgender', index: '2', class:'trans' }];

  socialCatMst: any = [{ name: 'General', index: '0' },
  { name: 'SC', index: '1' },
  { name: 'ST', index: '2'},
  { name: 'OBC', index: '3'},
  { name: 'ORC', index: '4'},
  { name: 'Others', index: '5'}]

  socialCatMax: any = 100

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


  constructor(private http: HttpService, public common: CommonService) { }

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    console.log(this.userObj)
    this.getBlockDash(this.userObj.blockCode);
  }

  getBlockDash(blockCode) {
    this.getTotalSchoolCount(blockCode);
    this.http.getBlockDashboard(blockCode).subscribe(res => {
      console.log(res);
      if (res.statusCode == environment.successCode) {
        this.createGenderData(res.dashboardData.genderWiseData);
        this.createSocialCatData(res.dashboardData.socialCatData)
      } else {

      }

    })
  }

  getTotalSchoolCount(blockCode) {
    this.http.getAllSchoolByBlock(blockCode, 1, 1).subscribe(res => {
      console.log(res)
      if(res.statusCode == environment.httpSuccess) {
        this.totalSchools = res.data.totalSize;
        this.totalCreated = true
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

}
