import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { MatDialog, MatDialogConfig, _MatDialogBase } from '@angular/material/dialog';

import { QuoteService } from 'src/app/services/quote.service';
import { Quote } from '../../../models/Quote/quote.model';
import { QuoteItemComponent } from '../quote-item/quote-item.component';
import { EditQuoteComponent } from '../edit-quote/edit-quote.component';
import { AddQuoteComponent } from '../add-quote/add-quote.component';
import { DeleteQuoteComponent } from '../delete-quote/delete-quote.component';
import { DataTableDirective } from 'angular-datatables';


@Component({
  selector: 'app-quotes',
  templateUrl: './quotes.component.html',
  styleUrls: ['./quotes.component.css']
})
export class QuotesComponent implements OnInit {

  quotes: Quote[];
  userQuotes: Quote[];
  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<any> = new Subject();


  @ViewChild(DataTableDirective, {static: false})
  dtElement: DataTableDirective;

  constructor(private quoteService: QuoteService, private router: Router, private dialog: MatDialog) { }

  ngOnInit(): void {
    this.quoteService.getUserQuoteList().subscribe(quotes => {
      this.quotes = quotes;
      this.dtTrigger.next();
    });

    this.quoteService.getUserQuoteList().subscribe(userquotes => {
      this.userQuotes = userquotes;
    });

    this.dtOptions = {
      pagingType: 'simple_numbers',
      pageLength: 5,
      lengthMenu: [5, 10, 25],
      processing: true,
      autoWidth: true,
      columnDefs: [
        { width: "100px", targets: 4 },
        { width: "50%", targets: 3 }
      ]
    };
  }


  onAdd() {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '100%';
    this.dialog.open(AddQuoteComponent, dialogConfig)
      .afterClosed().subscribe(() => {
        this.rerender();
        window.location.reload();
        console.log(`Dialog result: added`);   
    });
    
  }

  onView(item: Quote) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '100%';
    this.quoteService.currentQuote = item;
    this.dialog.open(QuoteItemComponent, dialogConfig);
  }

  onEdit(item: Quote) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '100%';
    this.quoteService.currentQuote = item;
    this.dialog.open(EditQuoteComponent, dialogConfig)
    .afterClosed().subscribe(() => {
        console.log(`Dialog result: Updated`);
        this.rerender();
    });
  }

  onDelete(item: Quote) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '50%';
    this.quoteService.currentQuote = item;
    this.dialog.open(DeleteQuoteComponent, dialogConfig)
      .afterClosed().subscribe(() => {
        console.log(`Dialog result: Closed`);
        this.rerender();
        window.location.reload();
    });
  }

  Logout() {
    localStorage.removeItem('userToken');
    this.router.navigate(['/login']);
  }

  ngOnDestroy(): void {
    this.dtTrigger.unsubscribe();
  }

  rerender(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      dtInstance.destroy();
      this.dtTrigger.next();
    });
  }

}
