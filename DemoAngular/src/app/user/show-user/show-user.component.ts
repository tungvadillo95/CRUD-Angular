import { Component, OnInit, ViewChild } from '@angular/core';
import { UserService } from '../../services/user.service';
import { AddEditUserComponent } from '../add-edit-user/add-edit-user.component';

@Component({
  selector: 'app-show-user',
  templateUrl: './show-user.component.html',
  styleUrls: ['./show-user.component.css']
})
export class ShowUserComponent implements OnInit {

  @ViewChild(AddEditUserComponent) myChild: any;
  @ViewChild('closeModalForm') closeModalForm: any;

  constructor(private service: UserService) { }

  userList: any[] = [];
  showModal: boolean = false;
  modalTitle: string = '';
  user: any;

  ngOnInit(): void {
    this.initUsers();
  }

  initUsers() {
    this.service.getUsers().subscribe(data => {
      this.userList = data;
    })
  }

  addClick() {
    this.showModal = true;
    this.modalTitle = 'THÊM USER';
    console.log('haha', this.closeModalForm);
  }

  editClick(id: number) {
    this.service.getUser(id).subscribe(data => {

      console.log('alter', this.myChild.user);
      this.myChild.initUser(data);
      console.log('befor', this.myChild.user);
      console.log('dataUser', this.myChild.user);
    });
    this.showModal = true;
    this.modalTitle = 'CẬP NHẬT USER'
  }

  closeModal() {
    this.closeModalForm.nativeElement.click();
  }

  closeClick() {
    this.showModal = false;
    this.initUsers();
  }
}
