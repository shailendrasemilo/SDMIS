import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CommonService {

  currentRoute: String = "Dashboard";
  constructor() { }

  setCurrentRoute(routeName: any) {
    this.currentRoute = routeName;
  }
}
