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

  saveStudentEducationInfo(requestDto) {
    return this.http.post<any>(environment.api_base_url + '/saveEducationDetail', requestDto);
  }

  saveStudentResultDetail(requestDto) {
    return this.http.post<any>(environment.api_base_url + '/saveResultDetail', requestDto);
  }
  
  saveStudentIncentiveDetail(requestDto) {
    return this.http.post<any>(environment.api_base_url + '/saveIncentiveDetail', requestDto);
  }

  saveStudentVocationalDetail(requestDto) {
    return this.http.post<any>(environment.api_base_url + '/saveVocationalDetail', requestDto);
  }

  getStudentById(studentId) {
    return this.http.get<any>(environment.api_base_url + '/getStudent?studentId=' + studentId, {});
  }

}
