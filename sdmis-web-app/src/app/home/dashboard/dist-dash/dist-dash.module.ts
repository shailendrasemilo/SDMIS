import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DistDashRoutingModule } from './dist-dash-routing.module';
import { DistDashComponent } from './dist-dash/dist-dash.component';
import { CommonDashComponent } from '../common-dash/common-dash/common-dash.component';
import { CommonDashModule } from '../common-dash/common-dash.module';
import { MatTableModule } from '@angular/material/table';
import { BlockDashModuleModule } from '../block-dash-module/block-dash-module.module';
import { MatButtonModule } from '@angular/material/button';


@NgModule({
  declarations: [DistDashComponent],
  imports: [
    CommonModule,
    DistDashRoutingModule,
    CommonDashModule,
    MatTableModule,
    BlockDashModuleModule,
    MatButtonModule
  ]
})
export class DistDashModule { }
