import { Component, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { CommonService } from 'src/app/services/common.service';
import { HttpService } from 'src/app/services/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-create-section',
  templateUrl: './create-section.component.html',
  styleUrls: ['./create-section.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class CreateSectionComponent implements OnInit {

  @ViewChild(MatPaginator) paginator: MatPaginator;

  userObj: any = {};
  classList: any = [];
  mstClassSection: any = {};
  sectionList: any = new MatTableDataSource();
  sectionTableHead: any = ['section']

  alertCount: number = 0;
  alertMsg: String;
  alertFlag: boolean = false;


  constructor(private http: HttpService, private common: CommonService) { }

  ngOnInit(): void {
    this.userObj = this.common.userObj;
    this.common.schoolDetail = JSON.parse(sessionStorage.getItem('schoolDetail'))
    this.classList = this.common.createSchoolClassList(this.common.schoolDetail.classFrom, this.common.schoolDetail.classTo)

  }


  saveSection() {
    this.mstClassSection.schoolId = this.common.schoolDetail.udiseCode
    this.mstClassSection.status = 'A'
    console.log(this.mstClassSection)
    let requestDto: any = {};
    requestDto.mstClassSection = this.mstClassSection
    this.http.saveSectionMst(requestDto).subscribe(res => {
      console.log(res)
      this.getSectionList(this.mstClassSection.className)
    })
  }

  getSectionList(className) {
    this.sectionList = new MatTableDataSource();
    console.log(className)
    this.http.getClassSection(className, this.common.schoolDetail.udiseCode).subscribe(res => {
      console.log(this.common.schoolDetail.udiseCode)
      console.log(res)
      if (res.statusCode == environment.successCode) {
        this.sectionList = new MatTableDataSource(res.mstClassSections);
        console.log(this.sectionList.data)
        setTimeout(() => {
          this.sectionList.paginator = this.paginator;
        }, 100);
      } else {
        this.alertFlag = true;
        this.alertCount = this.alertCount + 1
        this.alertMsg = 'No sections have been created for this class.';
      }
    })
  }

}
