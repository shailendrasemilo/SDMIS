import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { StudentProfileRoutingModule } from './student-profile-routing.module';
import { StudentProfileComponent } from './student-profile/student-profile.component';

import {MatStepperModule} from '@angular/material/stepper'; 
import { FormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { StudentBasicInfoComponent } from './student-basic-info/student-basic-info.component';


@NgModule({
  declarations: [StudentProfileComponent, StudentBasicInfoComponent],
  imports: [
    CommonModule,
    StudentProfileRoutingModule,
    MatStepperModule,
    MatButtonModule,
    MatInputModule,
    FormsModule
  ]
})
export class StudentProfileModule { }
