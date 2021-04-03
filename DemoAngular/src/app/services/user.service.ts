import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from "../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  getUsers(): Observable<any[]> {
    return this.http.get<any>(environment.url_back_end + '/user/gets');
  }

  getUser(id: number): Observable<any> {
    return this.http.get<any>(environment.url_back_end + '/user/get/' + id);
  }

  saveUser(user: any): Observable<any> {
    return this.http.post<any>(environment.url_back_end + '/user/save', user);
  }
}
