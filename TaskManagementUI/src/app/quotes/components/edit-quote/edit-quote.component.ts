import { Component, Input, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';

import { Quote } from 'src/app/models/Quote/quote.model';
import { QuoteService } from 'src/app/services/quote.service';

@Component({
  selector: 'app-edit-quote',
  templateUrl: './edit-quote.component.html',
  styleUrls: ['./edit-quote.component.css']
})
export class EditQuoteComponent implements OnInit {

  @Input() 
  currentQuote: Quote;
  successmsg: string;
  errormsg: string;

  constructor(private quoteService: QuoteService, public dialogRef: MatDialogRef<EditQuoteComponent>) { }

  ngOnInit(): void {
    this.currentQuote = this.quoteService.currentQuote;
  }

  onClose() {
    this.dialogRef.close();
  }

  onUpdate() {
    this.quoteService.updateQuote(this.currentQuote).subscribe(res => {
      this.successmsg = "Success";
      
      setTimeout(() => {
        this.onClose();
      }, 3000);
    }, (err => {
        this.errormsg = "Failure"
        
    }));
  }

}
