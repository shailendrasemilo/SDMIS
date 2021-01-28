import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: '1', pathMatch: 'full'},
  { path: '1', loadChildren: () => import('./school-dash-module/school-dash-module.module').then(m => m.SchoolDashModuleModule)},
  { path: '2', loadChildren: () => import('./block-dash-module/block-dash-module.module').then(m => m.BlockDashModuleModule)},
  { path: '3', loadChildren: () => import('./dist-dash/dist-dash.module').then(m => m.DistDashModule)}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }
