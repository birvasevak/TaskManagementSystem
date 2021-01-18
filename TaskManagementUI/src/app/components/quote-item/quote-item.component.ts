import { Component, Input, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { Quote } from 'src/app/models/Quote/quote.model';
import { QuoteService } from 'src/app/services/quote.service';

@Component({
  selector: 'app-quote-item',
  templateUrl: './quote-item.component.html',
  styleUrls: ['./quote-item.component.css']
})
export class QuoteItemComponent implements OnInit {

  @Input() currentQuote : Quote;

  constructor(private quoteService: QuoteService, public dialogRef: MatDialogRef<QuoteItemComponent>) { }

  ngOnInit(): void {
    // console.log(this.quoteService.currentQuote);
    this.currentQuote = this.quoteService.currentQuote;
  }

  onClose() {
    this.dialogRef.close();
  }

}
