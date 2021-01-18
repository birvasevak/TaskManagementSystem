import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'TaskManagementUI';
  isLoggedIn: boolean = localStorage.getItem('userToken') === null ? true : false;

  constructor(private router: Router){}
  ngOnInit() {
    /* if (localStorage.getItem('userToken') === null) {
      console.log('null');
      this.isLoggedIn = true;
    } else {
      console.log('not null');
      this.isLoggedIn = false;
    } */
  }

  

  logout() {
    localStorage.removeItem('userToken');
    this.router.navigate(['/login']);
  }
}
