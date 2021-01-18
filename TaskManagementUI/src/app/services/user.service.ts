import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { User } from '../models/User/user.model';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  readonly rootURL = "https://localhost:44360";

  constructor(private http: HttpClient) { }

  userRegistration(user: User) {
    const body: User = {
      UserName: user.Email,
      Password: user.Password,
      ConfirmPassword: user.ConfirmPassword,
      Email: user.Email,
      FirstName: user.FirstName,
      LastName: user.LastName
    }

    var reqHeader = new HttpHeaders({ 'No-Auth': 'True' });

    return this.http.post(this.rootURL + '/api/Account/Register', body, { headers: reqHeader });
  }

  userAuthentication(email, password) {
    var data = "UserName=" + email + "&password=" + password + "&grant_type=password";
    var reqHeader = new HttpHeaders({ 'Content-Type': 'application/x-www-urlencoded','No-Auth':'True' });
    return this.http.post(this.rootURL + '/token', data, { headers: reqHeader });
  }

}
