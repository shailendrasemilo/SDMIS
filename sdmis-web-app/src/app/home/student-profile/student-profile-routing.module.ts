import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { StudentBasicInfoComponent } from './student-basic-info/student-basic-info.component';
import { StudentProfileComponent } from './student-profile/student-profile.component';

const routes: Routes = [
  { path: '', component: StudentProfileComponent},
  { path: 'studentBasicInfo', component: StudentBasicInfoComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class StudentProfileRoutingModule { }
