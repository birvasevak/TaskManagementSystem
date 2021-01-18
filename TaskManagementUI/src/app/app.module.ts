import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule} from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule, routes } from './app-routing.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { RouterModule } from '@angular/router';
import { DataTablesModule } from 'angular-datatables';
import { ValidateEqualModule } from 'ng-validate-equal';
import { ToastrModule } from 'ngx-toastr';

import { AppComponent } from './app.component';
import { QuotesComponent } from './components/quotes/quotes.component';
import { UserComponent } from './components/user/user.component';
import { LoginComponent } from './components/user/login/login.component';
import { RegisterComponent } from './components/user/register/register.component';
import { MaterialModule } from './material/material.module';
import { UserService } from './services/user.service';
import { QuoteService } from './services/quote.service';
import { AuthGuard } from './auth/auth.guard';
import { QuoteItemComponent } from './components/quote-item/quote-item.component';
import { AddQuoteComponent } from './components/add-quote/add-quote.component';
import { EditQuoteComponent } from './components/edit-quote/edit-quote.component';
import { DeleteQuoteComponent } from './components/delete-quote/delete-quote.component';


@NgModule({
  declarations: [
    AppComponent,
    QuotesComponent,
    UserComponent,
    LoginComponent,
    RegisterComponent,
    QuoteItemComponent,
    AddQuoteComponent,
    EditQuoteComponent,
    DeleteQuoteComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    RouterModule.forRoot(routes),
    BrowserAnimationsModule,
    MaterialModule,
    DataTablesModule,
    ValidateEqualModule,
    ToastrModule.forRoot()
  ],
  providers: [
    UserService,
    QuoteService,
    AuthGuard
  ],
  bootstrap: [AppComponent],
  entryComponents: [DeleteQuoteComponent, EditQuoteComponent, AddQuoteComponent, QuoteItemComponent]
})
export class AppModule { }
