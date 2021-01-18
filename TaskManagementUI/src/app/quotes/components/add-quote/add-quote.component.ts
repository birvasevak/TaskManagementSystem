import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';

import { Quote } from 'src/app/models/Quote/quote.model';
import { QuoteService } from 'src/app/services/quote.service';

@Component({
  selector: 'app-add-quote',
  templateUrl: './add-quote.component.html',
  styleUrls: ['./add-quote.component.css']
})
export class AddQuoteComponent implements OnInit {

  successMsg: string;
  newQuote: Quote;
  @ViewChild('addForm') addForm : NgForm;

  constructor(private quoteService: QuoteService, public dialogRef: MatDialogRef<AddQuoteComponent>) { }

  ngOnInit(): void {
  }

  onClose() {
    this.dialogRef.close();
  }

  addNewQuote(item) {
    this.newQuote = item.value;
    this.quoteService.addNewQuote(this.newQuote).subscribe((data: any) => {
      this.successMsg = "Success";
      this.addForm.resetForm();
      setTimeout(() => {
        this.onClose();
      }, 3000);
    }, (error: HttpErrorResponse) => {
        console.log(error.message);
    })
  }

}
