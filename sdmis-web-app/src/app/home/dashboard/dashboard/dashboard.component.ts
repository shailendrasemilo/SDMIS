import { Component, OnInit } from '@angular/core';
import { Color } from 'ng2-charts';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  //api
  totalProfileData: any = { completeProfile: '510', remainingProfile: '450' };
  classwiseMaxStd: any = '200'
  profileWiseMaxStd: any = 1000;
  classWiseData: any = [
    { classRoman: 'I', count: '80', classNum: 1 },
    { classRoman: 'II', count: '40', classNum: 2 },
    { classRoman: 'III', count: '60', classNum: 3 },
    { classRoman: 'IV', count: '120', classNum: 4 },
    { classRoman: 'V', count: '10', classNum: 5 },
    { classRoman: 'VI', count: '90', classNum: 6 },
    { classRoman: 'VII', count: '100', classNum: 7 },
    { classRoman: 'VIII', count: '50', classNum: 8 },
    { classRoman: 'IX', count: '70', classNum: 9 },
    { classRoman: 'X', count: '32', classNum: 10 },
    { classRoman: 'XI', count: '22', classNum: 11 },
    { classRoman: 'XII', count: '41', classNum: 12 }
  ]

  profileWiseData: any = [
    { displayText: 'Complete Basic Info', count: '800' },
    { displayText: 'Complete Education Info', count: '200' },
    { displayText: 'Complete Vocational Info', count: '134' },
    { displayText: 'Complete Incentive Info', count: '541' },
    { displayText: 'Complete Result Info', count: '448' },
  ]

  //calculate
  profileSum: any;

  //default
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

  constructor() {
    console.log('initilized')
  }

  ngOnInit(): void {
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
    console.log(this.chartMasterData)
  }

}
