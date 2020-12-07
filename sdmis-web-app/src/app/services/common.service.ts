import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CommonService {

  currentRoute: String = "Dashboard";
  generatedStudentId: any;
  studentAction: any = 'summaryList';
  stdIdEdit: any;
  sidenavOpen: any = true;
  schoolDetail: any = {};

  classList: any = [
    { name: 'Class I', id: 'I', value: '1' },
    { name: 'Class II', id: 'II', value: '2' },
    { name: 'Class III', id: 'III', value: '3' },
    { name: 'Class IV', id: 'IV', value: '4' },
    { name: 'Class V', id: 'V', value: '5' },
    { name: 'Class VI', id: 'VI', value: '6' },
    { name: 'Class VII', id: 'VII', value: '7' },
    { name: 'Class VIII', id: 'VIII', value: '8' },
    { name: 'Class IX', id: 'IX', value: '9' },
    { name: 'Class X', id: 'X', value: '10' },
    { name: 'Class XI', id: 'XI', value: '11' },
    { name: 'Class XII', id: 'XII', value: '12' },
  ];

  userObj: any = {};

  constructor() { }

  setCurrentRoute(routeName: any) {
    this.currentRoute = routeName;
  }

  setGeneratedStdId(studentId: any) {
    this.generatedStudentId = studentId;
  }

  setStdIdForEdit(studentId: any) {
    this.stdIdEdit = studentId;
  }

  createSchoolClassList(classFrom, classTo) {
    let mstClass = [...this.classList]
    let classList = [];
    mstClass.filter(obj => {
      if (obj.value >= classFrom && obj.value <= classTo) {
        classList.push(obj)
      }
    })
    return classList
  }

}
