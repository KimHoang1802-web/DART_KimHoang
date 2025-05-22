/*
Bài 2: Quản lý tài khoản ngân hàng
Yêu cầu:
1.Tạo lớp BankAccount với các thuộc tính: accountNumber, ownerName,
balance
2.Cung cấp các phương thức:
Gửi tiền (deposit) và rút tiền (withdraw) với kiểm tra số dư.
Hiển thị số dư tài khoản.
3.Tạo đối tượng tài khoản và kiểm tra hoạt động của nó.
 */

import 'dart:io';

class BankAccount{
  String accountNumber;
  String ownerName;
  double balance;

  BankAccount(this.accountNumber, this.ownerName, this.balance);

  // Các phương thức: Gửi và rút tiền
  void deposit(double amount){
    
  }
}