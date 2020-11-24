import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from './dashboard/dashboard.component'
import { DashboardRoutingModule } from './dashboard-routing.module'
import { MatCardModule } from '@angular/material/card';
import { ChartsModule } from 'node_modules/ng2-charts'
import { MatProgressBarModule } from '@angular/material/progress-bar';

@NgModule({
  declarations: [ DashboardComponent ],
  imports: [
    CommonModule,
    DashboardRoutingModule,
    MatCardModule,
    ChartsModule,
    MatProgressBarModule
  ]
})
export class DashboardModule { }
