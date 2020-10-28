import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AlertComponent } from './alert/alert.component';
import { MatSnackBarModule } from '@angular/material/snack-bar';

@NgModule({
  declarations: [ AlertComponent ],
  imports: [
    CommonModule,
    MatSnackBarModule
  ],
  exports: [ AlertComponent ]
})
export class AlertModule { }
