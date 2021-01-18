import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';

import { User } from 'src/app/models/User/user.model';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  user: User;
  successMsg: string;
  errorMsg: string;

  constructor(private userService: UserService, private toastr: ToastrService) { }

  ngOnInit(): void {
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.reset();
    this.user = {
      UserName: '',
      Password: '',
      ConfirmPassword: '',
      Email: '',
      FirstName: '',
      LastName: ''
    }
  }

  onRegister(formUser) {
    console.log(formUser.value);
    this.user = {
      UserName: formUser.value.username,
      Email: formUser.value.email,
      Password: formUser.value.password,
      ConfirmPassword: formUser.value.confirmpassword,
      FirstName: formUser.value.fname,
      LastName: formUser.value.lname,
    }
    this.userService.userRegistration(this.user).subscribe((data) => {
      this.successMsg = "Success";
      this.resetForm(formUser);
      this.toastr.success('Please go ahead and login', 'Successfully Registered!');
      console.log(data);
    }, (error: HttpErrorResponse) => {
        console.log(error.message);
        this.errorMsg = error.message;
        this.toastr.error('Please try again', 'Error!');
    })
  }

}
