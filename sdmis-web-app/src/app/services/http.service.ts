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
    let params = new HttpParams();
    params = params.set('type', 'STATE');
    return this.http.get<any>(environment.mhrd_base_url + '/regionMasters', { params });
  }

  getDistrictsByState(stateId) {
    let params = new HttpParams();
    params = params.set('type', 'DISTRICT');
    params = params.set('stateCode', stateId);
    return this.http.get<any>(environment.mhrd_base_url + '/regionMasters', { params });
  }

  getBlocksByDistrict(distCode) {
    let params = new HttpParams();
    params = params.set('type', 'BLOCK');
    params = params.set('districtCode', distCode);
    return this.http.get<any>(environment.mhrd_base_url + '/regionMasters', { params });
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

  getStudentBasicInfoById(studentId, udiseCode) {
    let params = new HttpParams();
    params = params.set('studentId', studentId)
    params = params.set('udiseCode', udiseCode)
    console.log(params.toString())
    return this.http.get<any>(environment.api_base_url + '/viewStubasicDetail', { params });
  }

  getStudentSummary(stdSearchParam) {
    let params = new HttpParams();
    params = params.set('className', stdSearchParam.class)
    params = params.set('section', '')
    params = params.set('udiseCode', stdSearchParam.udiseCode)
    console.log(params.toString())
    return this.http.get<any>(environment.api_base_url + '/getStudentList', { params });
  }

  getEducationDetail(studentId, schoolId) {
    let params = new HttpParams();
    params = params.set('studentId', studentId)
    params = params.set('schoolId', schoolId)
    console.log(params.toString())

    return this.http.get<any>(environment.api_base_url + '/viewEducationDetail', { params });
  }

  getIncentiveDetail(studentId, schoolId) {
    let params = new HttpParams();
    params = params.set('studentId', studentId)
    params = params.set('schoolId', schoolId)
    console.log(params.toString())

    return this.http.get<any>(environment.api_base_url + '/viewIncentiveDetail', { params });
  }

  getVocationDetail(studentId, schoolId) {
    let params = new HttpParams();
    params = params.set('studentId', studentId)
    params = params.set('schoolId', schoolId)
    console.log(params.toString())

    return this.http.get<any>(environment.api_base_url + '/viewVocationalDetail', { params });
  }

  getResultDetail(studentId, schoolId) {
    let params = new HttpParams();
    params = params.set('studentId', studentId)
    params = params.set('schoolId', schoolId)
    console.log(params.toString())
    return this.http.get<any>(environment.api_base_url + '/viewResultDetail', { params });
  }

  getSchoolDashboard(udiseCode) {
    let params = new HttpParams();
    params = params.set('udiseCode', udiseCode)
    return this.http.get<any>(environment.api_base_url + '/getSchoolDasboard', { params });
  }

  getBlockMoreDashboard(blockCode) {
    let params = new HttpParams();
    params = params.set('blockCode', blockCode)
    return this.http.get<any>(environment.api_base_url + '/getGenderAndCategoryData', { params });
  }

  getBlockEnrollment(blockCode) {
    let params = new HttpParams();
    params = params.set('blockCode', blockCode)
    return this.http.get<any>(environment.api_base_url + '/getBlockDasboard', { params });
  }

  saveSectionMst(requestDto) {
    return this.http.post<any>(environment.api_base_url + '/saveClassSection', requestDto);
  }

  getClassSection(className, udiseCode) {
    let params = new HttpParams();
    params = params.set('className', className)
    params = params.set('schoolId', udiseCode)
    console.log(params.toString())
    return this.http.get<any>(environment.api_base_url + '/getClassSection', { params });
  }

  getAllSchoolByBlock(blockCode, page, limit) {
    let params = new HttpParams();
    params = params.set('blockCode', blockCode)
    params = params.set('page', page)
    params = params.set('pageLimit', limit)
    return this.http.get<any>(environment.mhrd_base_url + '/schoolMaster/byBlockCode', { params })
  }

  getSchoolByUdise(udiseCode) {
    let params = new HttpParams();
    params = params.set('udiseCode', udiseCode)
    return this.http.get<any>(environment.mhrd_base_url + '/schoolMaster/byUdiseCode', { params })
  }

  getSocialCategory() {
    let params = new HttpParams();
    params = params.set('masterType', 'SOCIAL_CATEGORY')
    return this.http.get<any>(environment.mhrd_base_url + '/masters', { params })
  }

  getReligion() {
    let params = new HttpParams();
    params = params.set('masterType', 'RELIGION')
    return this.http.get<any>(environment.mhrd_base_url + '/masters', { params })
  }
  getMoiMaster(stateCode) {
    let params = new HttpParams();
    params = params.set('masterType', 'MEDIUM_OF_INSTRUCTION')
    params = params.set('stateCode', stateCode)
    return this.http.get<any>(environment.mhrd_base_url + '/masters', { params })
  }
  getSchoolingStatus() {
    let params = new HttpParams();
    params = params.set('masterType', 'SCHOOLING_STATUS')
    return this.http.get<any>(environment.mhrd_base_url + '/masters', { params })
  }

  getJobRole() {
    let params = new HttpParams();
    params = params.set('masterType', 'JOB_ROLE')
    return this.http.get<any>(environment.mhrd_base_url + '/masters', { params })
  }

  getTradeList() {
    let params = new HttpParams();
    params = params.set('masterType', 'TRADE_SECTOR')
    return this.http.get<any>(environment.mhrd_base_url + '/masters', { params })
  }

  getCwsnList() {
    let params = new HttpParams();
    params = params.set('masterType', 'CWSN_FACILITY')
    return this.http.get<any>(environment.mhrd_base_url + '/masters', { params })
  }

  getDisability() {
    let params = new HttpParams();
    params = params.set('masterType', 'DIS_TYPE')
    return this.http.get<any>(environment.mhrd_base_url + '/masters', { params })
  }

  getStdClassCount(udiseCode) {
    let params = new HttpParams();
    params = params.set('udiseCode', udiseCode)
    return this.http.get<any>(environment.api_base_url + '/getclassStdCount', { params })
  }

  getSchoolProgress(blockCode) {
    let params = new HttpParams();
    params = params.set('blockCode', blockCode)
    return this.http.get<any>(environment.api_base_url + '/getSchoolCount', { params })
  }

  getBlockByBlockCode(blockCode) {
    let params = new HttpParams();
    params = params.set('regionType', 'BLOCK')
    params = params.set('blockCode', blockCode)
    return this.http.get<any>(environment.mhrd_base_url + '/regionDetails', { params })
  }

  getMgmtCatCount(regionType, regionCode, type) {
    let params = new HttpParams();
    params = params.set('regionType', regionType)
    params = params.set('countBy', type)
    params = params.set('regionCode', regionCode)
    console.log(params.toString())
    return this.http.get<any>(environment.mhrd_base_url + '/schoolCount', { params })
  }

  getDistDetail(distCode) {
    let params = new HttpParams();
    params = params.set('regionType', 'DISTRICT')
    params = params.set('districtCode', distCode)
    return this.http.get<any>(environment.mhrd_base_url + '/regionDetails', { params })
  }

}
