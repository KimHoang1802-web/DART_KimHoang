/*
Bài Tập Lớn: Quản Lý Sản Phẩm
Đề bài:
Viết chương trình quản lý sản phẩm trong cửa hàng gồm các chức năng sau:
1. Thêm sản phẩm vào danh sách.
○ Mỗi sản phẩm có:
■ Tên sản phẩm.
■ Giá tiền.
■ Số lượng trong kho.
2. Hiển thị danh sách sản phẩm với thông tin chi tiết.
3. Tìm kiếm sản phẩm theo tên.
4. Bán sản phẩm:
○ Nhập tên sản phẩm và số lượng cần bán.
○ Giảm số lượng tồn kho nếu có đủ hàng.
○ Báo lỗi nếu số lượng hàng không đủ.
5. Thoát chương trình.
 */
import 'dart:io';

void main() {
  List<Map<String, dynamic>> danhSachSanPham = [];

  while (true) {
    print('\n==== MENU QUẢN LÝ SẢN PHẨM ====');
    print('1. Thêm sản phẩm');
    print('2. Hiển thị danh sách sản phẩm');
    print('3. Tìm kiếm sản phẩm theo tên');
    print('4. Bán sản phẩm');
    print('5. Thoát');
    print('Chọn chức năng (1-5): ');
    String chucNang = stdin.readLineSync()!;
    print('--------------------------------');

    switch (chucNang) {
      case '1':
        stdout.write('Nhập tên sản phẩm: ');
        String? ten = stdin.readLineSync();

        stdout.write('Nhập giá tiền: ');
        double gia = double.parse(stdin.readLineSync()!);

        stdout.write('Nhập số lượng: ');
        int soLuong = int.parse(stdin.readLineSync()!);

        Map<String, dynamic> sp = {
          'ten': ten,
          'gia': gia,
          'soLuong': soLuong
        };
        danhSachSanPham.add(sp);
        print('Đã thêm sản phẩm.');
        break;

      case '2':
        if (danhSachSanPham.isEmpty) {
          print('Danh sách sản phẩm trống.');
        } else {
          print('\n Danh sách sản phẩm:');
          for (var sp in danhSachSanPham) {
            print('Tên: ${sp['ten']} - Giá: ${sp['gia']} - Số lượng: ${sp['soLuong']}');
          }
        }
        break;

      case '3':
        stdout.write('Nhập tên sản phẩm cần tìm: ');
        String? tenTim = stdin.readLineSync();
        bool timThay = false;

        for (var sp in danhSachSanPham) {
          if (sp['ten'] == tenTim) {
            print('Tìm thấy: Tên: ${sp['ten']} - Giá: ${sp['gia']} - Số lượng: ${sp['soLuong']}');
            timThay = true;
            break;
          }
        }

        if (!timThay) {
          print('Không tìm thấy sản phẩm có tên "$tenTim".');
        }
        break;

      case '4':
        stdout.write('Nhập tên sản phẩm cần bán: ');
        String? tenBan = stdin.readLineSync();
        stdout.write('Nhập số lượng cần bán: ');
        int slBan = int.parse(stdin.readLineSync()!);
        bool timThay = false;

        for (var sp in danhSachSanPham) {
          if (sp['ten'] == tenBan) {
            timThay = true;
            if (sp['soLuong'] >= slBan) {
              sp['soLuong'] -= slBan;
              print('Đã bán $slBan sản phẩm "$tenBan". Số lượng còn lại: ${sp['soLuong']}');
            } else {
              print('Không đủ hàng để bán. Chỉ còn ${sp['soLuong']} sản phẩm.');
            }
            break;
          }
        }

        if (!timThay) {
          print('Không tìm thấy sản phẩm "$tenBan".');
        }
        break;

      case '5':
        print('Thoát chương trình.');
        return;

      default:
        print('Chức năng không hợp lệ. Vui lòng chọn lại.');
    }
  }
}

