/*
Bài tập quản lý sinh viên
Đề bài:
Viết chương trình nhập vào thông tin của một nhân viên:
● Họ tên.
● Số giờ làm việc.
● Lương mỗi giờ.
Chương trình sẽ:
1. Tính tổng lương = số giờ làm × lương mỗi giờ.
2. Thêm phụ cấp:
○ Nếu làm hơn 40 giờ, nhân viên nhận thêm 20% tổng lương.
3. Trừ thuế thu nhập:
○ Lương trên 10 triệu: trừ 10%.
○ Lương từ 7 đến 10 triệu: trừ 5%.
○ Lương dưới 7 triệu: không trừ.
4. In kết quả:
○ Họ tên, tổng lương trước thuế, thuế thu nhập, và lương thực lãnh.
 */
import 'dart:io';

void main() {
  // Nhập thông tin của nhân viên
  print('Nhập họ tên nhân viên:');
  String hoTen = stdin.readLineSync()!;

  print("Nhập số giờ làm việc:");
  int soGioLam = int.parse(stdin.readLineSync()!);

  print("Nhập lương mỗi giờ:");
  double luongMotGio = double.parse(stdin.readLineSync()!);

  // Tính tổng lương
  double tongLuongTruocThue = soGioLam * luongMotGio;

  double phuCap = 0;
  double thue = 0;

  // Nếu làm hơn 40 giờ, nhân viên nhận thêm 20% tổng lương
  if (soGioLam > 40) {
    phuCap = tongLuongTruocThue * 0.2;
    tongLuongTruocThue += phuCap;
  }

  // Tính thuế dựa trên tổng lương trước thuế
  if (tongLuongTruocThue > 10000000) {
    thue = tongLuongTruocThue * 0.1;
  } else if (tongLuongTruocThue >= 7000000 && tongLuongTruocThue <= 10000000) {
    thue = tongLuongTruocThue * 0.05;
  }

  double luongThucLanh = tongLuongTruocThue - thue;

  // In kết quả
  print("\n---- KẾT QUẢ ----");
  print("Họ tên: $hoTen");
  print("Tổng lương trước thuế: ${tongLuongTruocThue.toStringAsFixed(0)} VND");
  print("Thuế thu nhập: ${thue.toStringAsFixed(0)} VND");
  print("Lương thực lãnh: ${luongThucLanh.toStringAsFixed(0)} VND");
}
