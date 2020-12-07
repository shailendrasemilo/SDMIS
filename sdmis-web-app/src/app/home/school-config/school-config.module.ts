import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SchoolConfigRoutingModule } from './school-config-routing.module';
import { CreateSectionComponent } from './create-section/create-section.component';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatInputModule } from '@angular/material/input';
import { AlertModule } from 'src/app/alert/alert.module';
import { FormsModule } from '@angular/forms';
import { MatSelectModule } from '@angular/material/select';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';


@NgModule({
  declarations: [CreateSectionComponent],
  imports: [
    CommonModule,
    SchoolConfigRoutingModule,
    MatButtonModule,
    MatCardModule,
    MatInputModule,
    MatSelectModule,
    AlertModule,
    MatTableModule,
    MatPaginatorModule,
    FormsModule
  ]
})
export class SchoolConfigModule { }
