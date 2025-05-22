/*
Bài tập quản lý sinh viên
Đề bài:
Viết chương trình quản lý danh sách sinh viên gồm các chức năng sau:
1. Thêm sinh viên vào danh sách. Mỗi sinh viên có:
○ Họ tên.
○ Điểm toán.
○ Điểm lý.
○ Điểm hóa.
2. Hiển thị danh sách sinh viên kèm theo:
○ Điểm trung bình (ĐTB).
○ Xếp loại học lực dựa trên ĐTB:
Dưới 5: Kém, 5 - 7: Khá, 7 - 9: Giỏi, lớn hơn 9: Xuất sắc
1. Tìm sinh viên có ĐTB cao nhất trong danh sách.
2. Thoát chương trình.
 */
import 'dart:io';

void main() {
  List<Map<String, dynamic>> danhSachSinhVien = [];

  while (true) {
    print('\n=== MENU ===');
    print('1. Thêm sinh viên');
    print('2. Hiển thị danh sách sinh viên');
    print('3. Tìm sinh viên có ĐTB cao nhất');
    print('4. Thoát');

    print('Chọn chức năng (1-4): ');
    String chucNang = stdin.readLineSync()!;

    switch (chucNang) {
      case '1':
        stdout.write('Nhập họ tên sinh viên: ');
        String? hoTen = stdin.readLineSync();

        stdout.write('Nhập điểm Toán: ');
        double diemToan = double.parse(stdin.readLineSync()!);

        stdout.write('Nhập điểm Lý: ');
        double diemLy = double.parse(stdin.readLineSync()!);

        stdout.write('Nhập điểm Hóa: ');
        double diemHoa = double.parse(stdin.readLineSync()!);

        Map<String, dynamic> sinhVien = {
          'hoTen': hoTen,
          'diemToan': diemToan,
          'diemLy': diemLy,
          'diemHoa': diemHoa
        };

        danhSachSinhVien.add(sinhVien);
        print('Đã thêm sinh viên thành công!');
        break;

      case '2':
        if (danhSachSinhVien.isEmpty) {
          print('Danh sách sinh viên trống!');
        } else {
          print('\n=== DANH SÁCH SINH VIÊN ===');
          for (var sv in danhSachSinhVien) {
            double dtb = (sv['diemToan'] + sv['diemLy'] + sv['diemHoa']) / 3;
            String xepLoai;

            if (dtb < 5) {
              xepLoai = 'Kém';
            } else if (dtb < 7) {
              xepLoai = 'Khá';
            } else if (dtb < 9) {
              xepLoai = 'Giỏi';
            } else {
              xepLoai = 'Xuất sắc';
            }

            print('${sv['hoTen']} - ĐTB: ${dtb.toStringAsFixed(2)} - Xếp loại: $xepLoai');
          }
        }
        break;

      case '3':
        if (danhSachSinhVien.isEmpty) {
          print('Danh sách sinh viên trống!');
        } else {
          Map<String, dynamic> svMax = danhSachSinhVien[0];
          double dtbMax = (svMax['diemToan'] + svMax['diemLy'] + svMax['diemHoa']) / 3;

          for (var sv in danhSachSinhVien) {
            double dtb = (sv['diemToan'] + sv['diemLy'] + sv['diemHoa']) / 3;
            if (dtb > dtbMax) {
              dtbMax = dtb;
              svMax = sv;
            }
          }

          String xepLoai;
          if (dtbMax < 5) {
            xepLoai = 'Kém';
          } else if (dtbMax < 7) {
            xepLoai = 'Khá';
          } else if (dtbMax < 9) {
            xepLoai = 'Giỏi';
          } else {
            xepLoai = 'Xuất sắc';
          }

          print('\n Sinh viên có ĐTB cao nhất:');
          print('${svMax['hoTen']} - ĐTB: ${dtbMax.toStringAsFixed(2)} - Xếp loại: $xepLoai');
        }
        break;

      case '4':
        print('Thoát chương trình. Tạm biệt!');
        return;

      default:
        print('Lựa chọn không hợp lệ. Vui lòng chọn từ 1 đến 4.');
    }
  }
}
