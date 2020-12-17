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

@NgModule({
  declarations: [ DashboardComponent ],
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
