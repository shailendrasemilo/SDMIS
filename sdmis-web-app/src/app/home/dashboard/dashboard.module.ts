import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from './dashboard/dashboard.component'
import { DashboardRoutingModule } from './dashboard-routing.module'
import { MatCardModule } from '@angular/material/card';
import { ChartsModule } from 'node_modules/ng2-charts'
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { AlertModule } from 'src/app/alert/alert.module';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatButtonModule } from '@angular/material/button';
import { Dashboard2Component } from './dashboard/dashboard2/dashboard2.component';

@NgModule({
  declarations: [ DashboardComponent, Dashboard2Component ],
  imports: [
    CommonModule,
    DashboardRoutingModule,
    MatCardModule,
    ChartsModule,
    MatProgressBarModule,
    AlertModule,
    MatTableModule,
    MatPaginatorModule,
    MatButtonModule
  ]
})
export class DashboardModule { }
