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


  basicInfoTableHead = ['name', 'admissionNum', 'doa', 'class', 'section', 'gender', 'action'];
  showProgress: boolean = false;

  sectionList: any = [];

  stdSearchParam: any = {};
  userObj: any = {}
  constructor(private httpService: HttpService, public common: CommonService) { }

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    this.common.studentAction = 'summaryList';
    let interval = setInterval(() => {
      console.log('interval')
      if (this.common.schoolDetail) {
        console.log('found')
        this.classList = this.common.createSchoolClassList(this.common.schoolDetail.classFrom, this.common.schoolDetail.classTo)
        clearInterval(interval)
      }
    }, 1)
  }

  clearSearchObjs() {
    this.stdSearchParam = {};
    this.common.studentAction = 'summaryList';
    this.basicInfoList = new MatTableDataSource();
  }

  getSectionList(className) {
    console.log(className)
    this.httpService.getClassSection(className, this.userObj.schoolId).subscribe(res => {
      console.log(res)
      if (res.statusCode == environment.successCode) {
        this.sectionList = res.mstClassSections
      } else {
        this.alertFlag = true;
        this.alertCount = this.alertCount + 1
        this.alertMsg = 'No sections have been created for this class.';
      }
    })
  }

  getStudentList() {
    this.common.stdIdEdit = null;
    this.common.studentAction = 'summaryList';
    let userObj = this.common.userObj
    this.basicInfoList = new MatTableDataSource();
    this.stdSearchParam.udiseCode = this.common.schoolDetail.udiseCode;
    this.httpService.getStudentSummary(this.stdSearchParam).subscribe(data => {
      console.log(data)
      if (data.statusCode == environment.successCode) {
        if (data.studentListDatas.length > 0) {
          this.basicInfoList = new MatTableDataSource(data.studentListDatas);
          console.log(this.basicInfoList)
          setTimeout(() => {
            this.basicInfoList.paginator = this.paginator;
          }, 100);
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
    this.moveStepper();
    this.stdSearchParam = {};
    this.common.studentAction = 'summaryList';
    this.alertMsg = "Student Profile has been completed";
    this.alertCount = this.alertCount + 1;
    this.alertFlag = true;
  }

  viewStudentDetails(studentId) {
    console.log(studentId)
    this.common.studentAction = 'edit';
    this.common.setStdIdForEdit(studentId);
  }

  applyFilter(searchText) {
    this.basicInfoList.filter = searchText.trim().toLowerCase();
  }

}
