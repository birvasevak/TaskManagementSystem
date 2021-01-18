import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from '../auth/auth.guard';
import { QuoteItemComponent } from './components/quote-item/quote-item.component';
import { QuotesComponent } from './components/quotes/quotes.component';

const routes: Routes = [
  {
    path: '', component: QuotesComponent, canActivate: [AuthGuard],
    
  },
  {
    path: 'addQuote', component: QuoteItemComponent, canActivate: [AuthGuard]
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class QuotesRoutingModule { }
