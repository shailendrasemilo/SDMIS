import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { StudentProfileRoutingModule } from './student-profile-routing.module';
import { StudentProfileComponent } from './student-profile/student-profile.component';

import { MatStepperModule } from '@angular/material/stepper';
import { FormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { StudentBasicInfoComponent } from './student-basic-info/student-basic-info.component';
import { StudentEducationComponent } from './student-education/student-education.component';
import { MatRadioModule } from '@angular/material/radio';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatSelectModule } from '@angular/material/select';
import { DateAdapter, MatNativeDateModule } from '@angular/material/core';
import { AlertModule } from 'src/app/alert/alert.module';
import { DirectiveModule } from 'src/app/directives/directive/directive.module';
import { MatTableModule } from '@angular/material/table';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { StudentIncentiveComponent } from './student-incentive/student-incentive.component';
import { StudentVocationalComponent } from './student-vocational/student-vocational.component';
import { StudentResultComponent } from './student-result/student-result.component';

@NgModule({
  declarations: [StudentProfileComponent, StudentBasicInfoComponent, StudentEducationComponent,
     StudentIncentiveComponent, StudentVocationalComponent, StudentResultComponent],
  imports: [
    CommonModule,
    StudentProfileRoutingModule,
    MatStepperModule,
    MatButtonModule,
    MatInputModule,
    MatRadioModule,
    MatSelectModule,
    MatDatepickerModule,
    MatNativeDateModule,
    FormsModule,
    AlertModule,
    DirectiveModule,
    MatTableModule,
    MatProgressBarModule
  ]
})
export class StudentProfileModule {

  constructor(private dateAdapter: DateAdapter<Date>) {
    dateAdapter.setLocale('en-in'); // DD/MM/YYYY
  }
}
