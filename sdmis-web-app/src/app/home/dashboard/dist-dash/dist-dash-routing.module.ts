import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DistDashComponent } from './dist-dash/dist-dash.component';

const routes: Routes = [
  {path: '', component: DistDashComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DistDashRoutingModule { }
