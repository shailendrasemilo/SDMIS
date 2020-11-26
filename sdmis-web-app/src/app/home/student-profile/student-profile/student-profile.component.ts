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
  basicInfoTableHead = ['name', 'admissionNum', 'dob', 'doa', 'gender', 'action'];
  showProgress: boolean = false;

  sectionList: any = [{ name: 'Section A', id: 1 }, { name: 'Section B', id: 2 }];
  classList: any = [{ name: 'Class I', id: 1 }, { name: 'Class II', id: 2 }];

  constructor(private httpService: HttpService, public common: CommonService) { }

  ngOnInit(): void {
    this.getStudentList();
  }

  getStudentList() {
    this.common.studentAction = 'view';
    this.httpService.getStudents().subscribe(data => {
      if (data.length > 0) {
        this.basicInfoList = new MatTableDataSource(data);
        console.log(this.basicInfoList)
        setTimeout(() => {
          this.basicInfoList.paginator = this.paginator;
        }, 100);
      } else {
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
        this.alertMsg = 'Student Records not found';
      }
    }, error => {
      this.alertCount = this.alertCount + 1;
      this.alertFlag = true;
      this.alertMsg = 'Some error occured';
    })
  }

  receiveBasicInfoData(event) {
    this.requestDto = event;
    console.log(this.requestDto)
    this.httpService.saveStudentBasicInfo(this.requestDto).subscribe(res => {
      console.log(res);
      if (res.statusCode == environment.successCode) {
        let basicInfo = res.studentBasicDetail;
        this.common.setGeneratedStdId(basicInfo.recordId)
        this.moveStepper();

      } else {
        this.alertMsg = res.description;
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      }
    },
      error => {
        this.alertMsg = "Some problem occurred while saving data. Please try again.";
        this.alertCount = this.alertCount + 1;
        this.alertFlag = true;
      })

  }

  moveStepper() {
    this.stepper.selected.completed = true;
    this.stepper.next();
    this.stepper.selected.completed = false;

  }

  receiveEducationInfo(event) {
    this.requestDto = event;
    console.log(this.requestDto)
    this.httpService.saveStudentEducationInfo(this.requestDto).subscribe(res => {
      console.log(res);
      this.moveStepper();
    })
  }

  receiveIncentiveInfo(event) {
    console.log(event)
    this.requestDto = event;
    this.httpService.saveStudentIncentiveDetail(this.requestDto).subscribe(res => {
      console.log(res)
      this.moveStepper();
    })
  }

  receiveVocationalInfo(event) {
    console.log(event)
    this.requestDto = event
    this.httpService.saveStudentVocationalDetail(this.requestDto).subscribe(res => {
      console.log(res)
      this.moveStepper();
    })

  }

  receiveResultInfo(event) {
    console.log(event)
    this.requestDto = event;
    this.httpService.saveStudentResultDetail(this.requestDto).subscribe(res => {
      console.log(res)
      this.moveStepper();
    })

  }

  editStudentDetails(studentId) {
    this.common.studentAction = 'edit';
    this.common.setStdIdForEdit(studentId);
  }

}
