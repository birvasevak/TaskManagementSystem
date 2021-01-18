import { HttpErrorResponse } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  @Input()
  LoginError: string;
  public errorMsg;
  showError: boolean;

  constructor(private userService: UserService, private router: Router, private toastr: ToastrService) { }

  emailRegex: string = "/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/";

  ngOnInit(): void {
    // console.log(loginForm);
  }

  onLoginSubmit(email, password) {
    this.userService.userAuthentication(email, password)
      .subscribe((data: any) => {
      // console.log(data.access_token);
      localStorage.setItem('userToken', data.access_token);
        this.router.navigate(['/quotes']);
        this.showError = false;
        this.toastr.success( 'Login!', 'Succesful');
    },
      (error) => {
        this.LoginError = error.error.error_description;
        console.log(this.LoginError);
        this.showError = true;
        // alert(this.LoginError);
        this.toastr.error('Email or Password is incorrect', 'Error');
        // this.errorMsg = error;
    });
    // debugger
    // this.showError = true;
    
    // console.log(this.showError)
  }

}
