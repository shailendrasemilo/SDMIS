import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CommonService {

  currentRoute: String = "Dashboard";
  generatedStudentId: any;
  studentAction: any = 'view';
  stdIdEdit: any;

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
}
