import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BlockDashModuleRoutingModule } from './block-dash-module-routing.module';
import { Dashboard2Component } from './block-dash/dashboard2.component';
import { MatCardModule } from '@angular/material/card';
import { ChartsModule } from 'ng2-charts';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { AlertModule } from 'src/app/alert/alert.module';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatButtonModule } from '@angular/material/button';
import { CommonDashModule } from '../common-dash/common-dash.module'

@NgModule({
  declarations: [ Dashboard2Component ],
  imports: [
    CommonModule,
    BlockDashModuleRoutingModule,
    MatCardModule,
    ChartsModule,
    MatProgressBarModule,
    AlertModule,
    MatTableModule,
    MatPaginatorModule,
    MatButtonModule,
    CommonDashModule
  ],
  exports: [Dashboard2Component]
})
export class BlockDashModuleModule { }
