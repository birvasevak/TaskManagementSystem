import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppComponent } from './app.component';
import { AuthGuard } from './auth/auth.guard';
import { QuoteItemComponent } from './components/quote-item/quote-item.component';

import { QuotesComponent } from './components/quotes/quotes.component';
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
    path: 'quotes', component: QuotesComponent, canActivate: [AuthGuard],
    
  },
  {
    path: 'addQuote', component: QuoteItemComponent, canActivate: [AuthGuard]
  },
  { path: '', component: UserComponent, pathMatch: 'full'},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
