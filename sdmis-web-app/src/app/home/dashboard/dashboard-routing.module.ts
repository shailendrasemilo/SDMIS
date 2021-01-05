import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { Dashboard2Component } from './dashboard/dashboard2/dashboard2.component';

const routes: Routes = [
  { path: '', redirectTo: '1', pathMatch: 'full'},
  { path: '1', component: DashboardComponent},
  { path: '2', component: Dashboard2Component}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }
