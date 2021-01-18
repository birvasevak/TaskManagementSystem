import { Component, OnInit, Input } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';

import { Quote } from 'src/app/models/Quote/quote.model';
import { QuoteService } from 'src/app/services/quote.service';

@Component({
  selector: 'app-delete-quote',
  templateUrl: './delete-quote.component.html',
  styleUrls: ['./delete-quote.component.css']
})
export class DeleteQuoteComponent implements OnInit {
  
  @Input() currentQuote: Quote;
  successMsg: string;
  errorMsg: string;

  constructor(private quoteService: QuoteService, public dialogRef: MatDialogRef<DeleteQuoteComponent>) { }

  ngOnInit(): void {
    this.currentQuote = this.quoteService.currentQuote;
  }

  Delete() {
    this.quoteService.deleteQuote(this.currentQuote).subscribe(res => {
      this.successMsg = "Success";
      setTimeout(() => {
        this.onClose();
      }, 2000);
    }, (err => {
        this.errorMsg = "Failure";
    }))
  }

  onClose() {
    this.dialogRef.close();
  }

}
