import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CommonDashComponent } from './common-dash/common-dash.component';
import { MatCardModule } from '@angular/material/card';



@NgModule({
  declarations: [CommonDashComponent],
  imports: [
    CommonModule,
    MatCardModule,
  ],
  exports: [CommonDashComponent]
})
export class CommonDashModule { }
