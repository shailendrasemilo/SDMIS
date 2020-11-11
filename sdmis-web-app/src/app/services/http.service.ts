import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class HttpService {

  constructor(private http: HttpClient) { }

  saveStudentBasicInfo(requestDto) {
    return this.http.post<any>(environment.api_base_url + '/saveStudentDetail', requestDto);
  }

  getStates() {
    return this.http.get<any>(environment.api_base_url + '/getState');
  }

  getDistrictsByState(stateId: Number) {
    return this.http.get<any>(environment.api_base_url + '/getDistrict?stateId=' + stateId);
  }

  getBlocksByDistrict(districtId: Number) {
    return this.http.get<any>(environment.api_base_url + '/getBlock?districtId=' + districtId);
  }

  getStudents() {
    return this.http.get<any>(environment.api_base_url + '/students');
  }

}
