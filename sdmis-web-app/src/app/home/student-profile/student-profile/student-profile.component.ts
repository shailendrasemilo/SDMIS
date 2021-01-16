import { Component, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { MatStepper } from '@angular/material/stepper';
import { environment } from 'src/environments/environment';
import { HttpService } from '../../../services/http.service';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { CommonService } from 'src/app/services/common.service';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';

@Component({
  selector: 'app-student-profile',
  templateUrl: './student-profile.component.html',
  styleUrls: ['./student-profile.component.css'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
  encapsulation: ViewEncapsulation.None
})
export class StudentProfileComponent implements OnInit {
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild("stepper") stepper: MatStepper;
  requestDto: any = {};
  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;
  basicInfoList: any = new MatTableDataSource;
  classList: any = [];
  schoolList: any = [];
  schoolTable: any = new MatTableDataSource;
  tableColumn: any = ['name', 'id', 'type', 'range']
  classColumn: any = ['class', 'std', 'view', 'add']
  showSchools: boolean = false;
  basicInfoTableHead = ['name', 'admissionNum', 'doa', 'class', 'section', 'gender', 'action'];
  showProgress: boolean = false;
  classStudentCount: any = [];
  schoolFilter: any;

  sectionList: any = [];

  stdSearchParam: any = {};
  userObj: any = {}
  constructor(private httpService: HttpService, public common: CommonService) { }

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    if (this.userObj.userType == 'S') {
      this.common.schoolDetail = JSON.parse(sessionStorage.getItem('schoolDetail'))
      if (this.common.schoolDetail.udiseCode) {
        this.getClassBySchoolRange(this.common.schoolDetail)
      }
    } else if (this.userObj.userType == 'B') {
      this.common.studentAction = 'schoolList';
      this.getSchools(this.userObj.blockCode);
    }
  }

  getClassBySchoolRange(school) {
    if(this.userObj.userType == 'B') {
      this.common.schoolDetail = school;
      sessionStorage.setItem('schoolDetail', JSON.stringify(school))
    }
    this.classList = new MatTableDataSource(this.common.createSchoolClassList(school.classFrom, school.classTo))
    this.httpService.getStdClassCount(school.udiseCode).subscribe(res => {
      console.log(res)
      if (res.statusCode) {
        this.classStudentCount = res.dashboardData?.classesData
        this.common.studentAction = 'classList'
      }
      console.log(this.classStudentCount)
    })
    console.log(this.classList.data)
  }

  getSchools(blockCode) {
    this.httpService.getAllSchoolByBlock(blockCode, 1, 1).subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.httpSuccess) {
        this.httpService.getAllSchoolByBlock(blockCode, 1, res.data.totalSize).subscribe(res2 => {
          console.log(res2)
          if (res2.statusCode == environment.httpSuccess) {
            this.schoolList = res2.data.result;
            this.schoolTable = new MatTableDataSource(this.schoolList)
            this.setSchoolPaginator();
          }
        })
      } else {
        this.alertMsg = res.statusMessage;
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      }
    })
  }

  setSchoolPaginator() {
    setTimeout(() => {
      this.schoolTable.paginator = this.paginator;
    }, 100)
  }

  clearSearchObjs() {
    this.stdSearchParam = {};
    this.common.studentAction = 'summaryList';
    this.basicInfoList = new MatTableDataSource();
  }

  getStudentList(className) {
    console.log(className, this.common.schoolDetail.udiseCode)
    this.stdSearchParam.udiseCode = this.common.schoolDetail.udiseCode;
    this.stdSearchParam.class = className;
    this.common.stdIdEdit = null;
    this.basicInfoList = new MatTableDataSource();
    console.log(this.stdSearchParam)
    this.httpService.getStudentSummary(this.stdSearchParam).subscribe(data => {
      console.log(data)
      if (data.statusCode == environment.successCode) {
        if (data.studentListDatas.length > 0) {
          this.basicInfoList = new MatTableDataSource(data.studentListDatas);
          console.log(this.basicInfoList)
          setTimeout(() => {
            this.basicInfoList.paginator = this.paginator;
          }, 100);
          this.common.studentAction = 'summaryList'
        } else {
          this.alertCount = this.alertCount + 1;
          this.alertFlag = true;
          this.alertMsg = 'Student Records not found';
        }
      } else {
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
        this.alertMsg = 'Student Records not found';
      }

    }, error => {
      console.log(error)
      this.alertCount = this.alertCount + 1;
      this.alertFlag = true;
      this.alertMsg = 'Some error occured';
    })
  }

  moveStepper() {
    this.stepper.selected.completed = true;
    this.stepper.next();
    this.stepper.selected.completed = false;

  }

  resultEvent() {
    this.stdSearchParam = {};
    this.basicInfoList = new MatTableDataSource();
    this.alertMsg = "Student Profile has been completed";
    this.alertCount = this.alertCount + 1;
    this.alertFlag = true;
  }

  viewStudentDetails(studentId) {
    console.log(this.stdSearchParam)
    console.log(studentId)
    this.common.studentAction = 'edit';
    this.common.setStdIdForEdit(studentId);
  }

  applyFilter(searchText) {
    this.basicInfoList.filter = searchText.trim().toLowerCase();
  }

  applySchoolFilter(searchText) {
    this.schoolTable.filter = searchText.trim().toLowerCase();
    console.log(this.schoolTable.data)
    console.log(this.schoolTable.filteredData)

  }

  openProfile(className) {
    this.common.stdForClass = className
  }

}
