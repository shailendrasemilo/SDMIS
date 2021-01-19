import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { Dashboard2Component } from './block-dash/dashboard2.component';

const routes: Routes = [
  { path: '', component: Dashboard2Component}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BlockDashModuleRoutingModule { }
