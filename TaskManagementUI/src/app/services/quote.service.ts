import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { Quote } from '../models/Quote/quote.model'
import { Observable } from 'rxjs';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
}

@Injectable({
  providedIn: 'root'
})
export class QuoteService {

  formData: Quote;
  quoteList: Quote[];
  readonly rootURL = "https://localhost:44360/api"
  currentQuote: Quote;

  constructor(private http: HttpClient) { }

  getQuoteList():Observable<Quote[]> {
    return this.http.get<Quote[]>(this.rootURL + '/Quote',
      {
        headers: new HttpHeaders({
          'Authorization': 'Bearer ' + localStorage.getItem('userToken')
    })});
  }

  getUserQuoteList():Observable<Quote[]> {
    return this.http.get<Quote[]>(this.rootURL + '/QuotesperUser',
      {
        headers: new HttpHeaders({
          'Authorization': 'Bearer ' + localStorage.getItem('userToken')
    })});
  }

  addNewQuote(formData: Quote): Observable<any> {

    return this.http.post(this.rootURL + '/Quote', formData, {
        headers: new HttpHeaders({
          'Authorization': 'Bearer ' + localStorage.getItem('userToken')
    })});
  }

  updateQuote(formData: Quote):Observable<any> {
    return this.http.put(this.rootURL + '/Quote/'+formData.QuoteId, formData, {
        headers: new HttpHeaders({
          'Authorization': 'Bearer ' + localStorage.getItem('userToken')
    })});
  }

  deleteQuote(formData:Quote): Observable<any>{
    // console.log('id:'+formData.QuoteId)
    return this.http.delete(this.rootURL + '/Quote/'+formData.QuoteId, {
        headers: new HttpHeaders({
          'Authorization': 'Bearer ' + localStorage.getItem('userToken')
    })});
  }

   refreshList(){
    this.http.get(this.rootURL+'/Quote')
    .toPromise().then(res => this.quoteList = res as Quote[]);
  }

  

}
