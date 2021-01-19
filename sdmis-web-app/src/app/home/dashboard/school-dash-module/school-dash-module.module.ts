import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SchoolDashModuleRoutingModule } from './school-dash-module-routing.module';
import { DashboardComponent } from './school-dash/dashboard.component';
import { MatCardModule } from '@angular/material/card';
import { ChartsModule } from 'ng2-charts';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { AlertModule } from 'src/app/alert/alert.module';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatButtonModule } from '@angular/material/button';


@NgModule({
  declarations: [ DashboardComponent ],
  imports: [
    CommonModule,
    SchoolDashModuleRoutingModule,
    CommonModule,
    MatCardModule,
    ChartsModule,
    MatProgressBarModule,
    AlertModule,
    MatTableModule,
    MatPaginatorModule,
    MatButtonModule
  ]
})
export class SchoolDashModuleModule { }
