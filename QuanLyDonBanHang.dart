/*
Viết một chương trình quản lý hóa đơn bán hàng sử dụng hàm trong Dart. Chương trình cần
thực hiện các chức năng sau:
1. Thêm sản phẩm vào giỏ hàng - Bao gồm tên sản phẩm, số lượng và giá tiền.
2. Sửa và xóa sản phẩm ở giỏ hàng
3. Hiển thị giỏ hàng - Danh sách sản phẩm kèm theo thông tin chi tiết.
4. Tính tổng tiền hóa đơn - Tổng số tiền phải thanh toán.
Yêu cầu:
● Sử dụng hàm riêng cho từng chức năng.
● Dữ liệu sản phẩm được lưu trong danh sách (List) sử dụng Map.
● Hiển thị kết quả ra màn hình bằng print().
 */
import 'dart:io';

// Danh sách giỏ hàng
List<Map<String, dynamic>> gioHang = [];

void main() {
  while (true) {
    print('\n======= MENU QUẢN LÝ HÓA ĐƠN =======');
    print('1. Thêm sản phẩm vào giỏ hàng');
    print('2. Sửa sản phẩm trong giỏ hàng');
    print('3. Xóa sản phẩm khỏi giỏ hàng');
    print('4. Hiển thị giỏ hàng');
    print('5. Tính tổng tiền hóa đơn');
    print('6. Thoát');
    stdout.write('Chọn chức năng: ');
    String? luaChon = stdin.readLineSync();

    switch (luaChon) {
      case '1':
        themSanPham();
        break;
      case '2':
        suaSanPham();
        break;
      case '3':
        xoaSanPham();
        break;
      case '4':
        hienThiGioHang();
        break;
      case '5':
        tinhTongTien();
        break;
      case '6':
        print('Đã thoát chương trình.');
        return;
      default:
        print('Lựa chọn không hợp lệ!');
    }
  }
}

// 1. Thêm sản phẩm
void themSanPham() {
  stdout.write('Nhập tên sản phẩm: ');
  String? ten = stdin.readLineSync();

  stdout.write('Nhập số lượng: ');
  int soLuong = int.parse(stdin.readLineSync()!);

  stdout.write('Nhập giá tiền: ');
  double gia = double.parse(stdin.readLineSync()!);

  gioHang.add({
    'ten': ten,
    'soLuong': soLuong,
    'gia': gia,
  });

  print('Đã thêm sản phẩm vào giỏ hàng.');
}

// 2. Sửa sản phẩm
void suaSanPham() {
  stdout.write('Nhập tên sản phẩm cần sửa: ');
  String? ten = stdin.readLineSync();
  bool timThay = false;

  for (var sp in gioHang) {
    if (sp['ten'] == ten) {
      timThay = true;
      stdout.write('Nhập số lượng mới: ');
      sp['soLuong'] = int.parse(stdin.readLineSync()!);
      stdout.write('Nhập giá mới: ');
      sp['gia'] = double.parse(stdin.readLineSync()!);
      print('Đã cập nhật sản phẩm.');
      break;
    }
  }

  if (!timThay) {
    print('Không tìm thấy sản phẩm "$ten".');
  }
}

// 3. Xóa sản phẩm
void xoaSanPham() {
  stdout.write('Nhập tên sản phẩm cần xóa: ');
  String? ten = stdin.readLineSync();

  int truocXoa = gioHang.length;
  gioHang.removeWhere((sp) => sp['ten'] == ten);
  int sauXoa = gioHang.length;

  if (sauXoa < truocXoa) {
    print('Đã xóa sản phẩm "$ten".');
  } else {
    print('Không tìm thấy sản phẩm "$ten".');
  }
}


// 4. Hiển thị giỏ hàng
void hienThiGioHang() {
  if (gioHang.isEmpty) {
    print('Giỏ hàng trống.');
  } else {
    print('\n Danh sách sản phẩm trong giỏ hàng:');
    for (var sp in gioHang) {
      print('Tên: ${sp['ten']} - Số lượng: ${sp['soLuong']} - Giá: ${sp['gia']} - Thành tiền: ${(sp['soLuong'] * sp['gia']).toStringAsFixed(2)}');
    }
  }
}

// 5. Tính tổng tiền
void tinhTongTien() {
  double tong = 0;
  for (var sp in gioHang) {
    tong += sp['soLuong'] * sp['gia'];
  }
  print('Tổng tiền hóa đơn: ${tong.toStringAsFixed(2)} VNĐ');
}
