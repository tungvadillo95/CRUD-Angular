import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms'

function checkOld(dob: FormControl) {
  let dobArr = dob.value.split('-');
  let yearNow: number = (new Date).getFullYear();
  if (yearNow - dobArr[0] < 20 || yearNow - dobArr[0] > 60) {
    return { checkOld: true };
  }
  return null;
}

function comparePassword(c: AbstractControl) {
  const v = c.value;
  return (v.password === v.confirmPassword) ? null : {
    passwordnotmatch: true
  };
}

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})

export class FormComponent implements OnInit {
  registerForm: FormGroup = new FormGroup({});

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.registerForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      phone: ['', [Validators.required, Validators.pattern(/((09|03|07|08|05)+([0-9]{8}))$/)]],
      dob: ['', [Validators.required, checkOld]],
      pwGroup: this.fb.group({
        password: ['', [Validators.required, Validators.minLength(6)]],
        confirmPassword: ['', [Validators.required, Validators.minLength(6)]]
      }, { validator: comparePassword }),
    });
  }

  onSubmit() {
    console.log(this.registerForm);
  }
}
