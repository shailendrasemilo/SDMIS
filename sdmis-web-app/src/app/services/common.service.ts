import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CommonService {

  currentRoute: String = "Dashboard";
  generatedStudentId: any;

  constructor() { }

  setCurrentRoute(routeName: any) {
    this.currentRoute = routeName;
  }

  setGeneratedStdId(studentId: any) {
    this.generatedStudentId = studentId;
  }
}
