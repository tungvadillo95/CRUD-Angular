import { Component, OnInit, Output, EventEmitter } from '@angular/core';

import { FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-add-edit-user',
  templateUrl: './add-edit-user.component.html',
  styleUrls: ['./add-edit-user.component.css']
})
export class AddEditUserComponent implements OnInit {
  @Output() myClick = new EventEmitter();
  user: any;
  constructor(private fb: FormBuilder,
    private service: UserService) { }

  registerForm: FormGroup = new FormGroup({});
  ngOnInit(): void {
    this.registerForm = this.fb.group({
      id: 0,
      fullName: '',
      gender: '',
      dob: ''
    });
    console.log('user', this.user);
  }

  initUser(user: any) {
    this.registerForm = this.fb.group({
      id: user.id,
      fullName: user.fullName,
      gender: user.gender ? 'true' : 'false',
      dob: user.dobVal
    });
  }

  onSubmit() {
    let user = {
      id: parseInt(this.registerForm.value.id),
      fullName: this.registerForm.value.fullName,
      gender: this.registerForm.value.gender == 'true' ? true : false,
      dob: this.registerForm.value.dob
    }
    this.service.saveUser(user).subscribe(res => {
      alert(res.message);
      this.myClick.emit();
    })
  }
}
