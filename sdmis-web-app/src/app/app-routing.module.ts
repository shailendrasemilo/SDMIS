import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AuthGuard } from './gaurds/auth.guard'

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', loadChildren: () => import('./login/login.module').then(m => m.LoginModule) },
  { path: 'home', component: HomeComponent, canActivate: [AuthGuard], children: [
      { path: '', redirectTo: 'dashboard', pathMatch: 'full' },
      { path: 'dashboard', loadChildren: () => import('./home/dashboard/dashboard.module').then(m => m.DashboardModule)},
      { path: 'studentProfile', loadChildren: () => import('./home/student-profile/student-profile.module').then(m => m.StudentProfileModule) },
      { path: 'createSection', loadChildren: () => import('./home/school-config/school-config.module').then(m => m.SchoolConfigModule) },
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
