import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { LoginComponent } from './components/user/login/login.component';
import { RegisterComponent } from './components/user/register/register.component';
import { UserComponent } from './components/user/user.component';

export const routes: Routes = [
  {
    path: 'login', component: UserComponent,
    children: [{ path: '', component: LoginComponent}]
  },
  {
    path: 'register', component: UserComponent,
    children: [{ path: '', component: RegisterComponent}]
  },
  {
    path: 'quotes', loadChildren: () => import('../app/quotes/quotes.module').then(m => m.QuotesModule)
    
  },
  { path: '', component: UserComponent, pathMatch: 'full'},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
