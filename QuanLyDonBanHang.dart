/*
Bài tập quản lý đơn bán hàng
Đề bài:
Viết chương trình nhập vào thông tin của một hóa đơn bán hàng:
● Tên sản phẩm.
● Số lượng mua.
● Đơn giá.
Chương trình sẽ:
1. Tính thành tiền = số lượng × đơn giá.
2. Áp dụng giảm giá:
○ Nếu thành tiền >= 1,000,000, giảm giá 10%.
○ Nếu thành tiền từ 500,000 đến dưới 1,000,000, giảm giá 5%.
○ Nếu dưới 500,000, không giảm giá.
3. Tính thuế VAT 8% trên tổng số tiền sau giảm giá.
4. In hóa đơn bao gồm:
○ Tên sản phẩm, số lượng, đơn giá.
○ Thành tiền, giảm giá, thuế VAT, và tổng thanh toán cuối cùng.
 */
import 'dart:io';

void main(){
  // Nhập thông tin của hóa đơn
  print("Nhập tên sản phẩm: ");
  String tenSanPham = stdin.readLineSync()!;
  print ("Nhập số lượng mua: ");
  int soLuong = int.parse(stdin.readLineSync()!);
  print("Nhập đơn giá: ");
  double donGia = double.parse(stdin.readLineSync()!);

  // Tính thành tiền
  double thanhTien = soLuong * donGia;
  double giamGia = 0;
  double thueVAT = 0;
  double tongThanhTien = 0;

  /*
  Áp dụng giảm giá:
○ Nếu thành tiền >= 1,000,000, giảm giá 10%.
○ Nếu thành tiền từ 500,000 đến dưới 1,000,000, giảm giá 5%.
○ Nếu dưới 500,000, không giảm giá.
   */
  if (thanhTien >= 1000000){
    giamGia = thanhTien * 0.1;
  }
  else if (thanhTien >= 500000 && thanhTien < 1000000){
    giamGia = thanhTien * 0.05;
  }
/*
  Tính thuế VAT 8% trên tổng số tiền sau giảm giá.
   */
  thueVAT = (thanhTien - giamGia) * 0.08;
// Tinh tổng thanh toán cuối cùng
  tongThanhTien = (thanhTien - giamGia) + thueVAT;

  // In hóa đơn
  print("\n---- HÓA ĐƠN ----");
  print("Tên sản phẩm: $tenSanPham");
  print("Số lượng: $soLuong");
  print("Đơn giá: ${donGia.toStringAsFixed(0)} VND");
  print("Thành tiền: ${thanhTien.toStringAsFixed(0)} VND");
  print("Giảm giá: ${giamGia.toStringAsFixed(0)} VND");
  print("Thuế VAT: ${thueVAT.toStringAsFixed(0)} VND");
  print("Tổng thanh toán: ${tongThanhTien.toStringAsFixed(0)} VND");
}