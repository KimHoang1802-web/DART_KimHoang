/*
Mô tả bài toán:
Viết một hệ thống quản lý trường học với chức năng quản lý giáo viên, học sinh, và lớp học.
Yêu cầu chi tiết:
1. Lớp Person:
○ Thuộc tính: id, name, age, gender.
○ Là lớp cha cho các lớp con: Student và Teacher.
2. Lớp Student:
○ Kế thừa từ Person.
○ Thuộc tính riêng: grade (lớp học), score.
○ Phương thức: hiển thị thông tin sinh viên.
3. Lớp Teacher:
○ Kế thừa từ Person.
○ Thuộc tính riêng: subject, salary.
○ Phương thức: hiển thị thông tin giáo viên.
4. Lớp Classroom:
○ Thuộc tính: id, name, students, teacher.
○ Phương thức:
■ Thêm học sinh vào lớp.
■ Gán giáo viên phụ trách lớp.
■ Hiển thị thông tin lớp học.
5. Chức năng chính:
○ Quản lý danh sách học sinh và giáo viên.
○ Tính điểm trung bình của từng học sinh.
○ Gán giáo viên và học sinh vào lớp học.
○ Hiển thị báo cáo danh sách lớp và điểm số
 */
import 'dart:io';

// Lớp cơ sở Person
class Person {
  String id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

// Lớp Student kế thừa Person
class Student extends Person {
  String grade;
  double score;

  Student(String id, String name, int age, String gender, this.grade, this.score)
      : super(id, name, age, gender);

  void hienThiThongTin() {
    print('Học sinh: $name - Tuổi: $age - Giới tính: $gender - Lớp: $grade - Điểm: $score');
  }
}

// Lớp Teacher kế thừa Person
class Teacher extends Person {
  String subject;
  double salary;

  Teacher(String id, String name, int age, String gender, this.subject, this.salary)
      : super(id, name, age, gender);

  void hienThiThongTin() {
    print('Giáo viên: $name - Tuổi: $age - Giới tính: $gender - Môn dạy: $subject - Lương: \$${salary.toStringAsFixed(2)}');
  }
}

// Lớp Classroom
class Classroom {
  String id;
  String name;
  List<Student> danhSachHocSinh = [];
  Teacher? giaoVien;

  Classroom(this.id, this.name);

  void themHocSinh(Student sv) {
    danhSachHocSinh.add(sv);
    print('✅ Đã thêm học sinh ${sv.name} vào lớp $name');
  }

  void ganGiaoVien(Teacher gv) {
    giaoVien = gv;
    print('✅ Đã gán giáo viên ${gv.name} phụ trách lớp $name');
  }

  void hienThiThongTinLop() {
    print('\n=== Thông tin lớp học $name ===');
    print('Giáo viên phụ trách: ${giaoVien?.name ?? "Chưa có"}');
    print('Danh sách học sinh:');
    for (var sv in danhSachHocSinh) {
      sv.hienThiThongTin();
    }
    print('==============================\n');
  }

  void hienThiBaoCaoDiem() {
    print('\n=== Báo cáo điểm lớp $name ===');
    for (var sv in danhSachHocSinh) {
      String xepLoai;
      if (sv.score >= 9) {
        xepLoai = 'Xuất sắc';
      } else if (sv.score >= 7) {
        xepLoai = 'Giỏi';
      } else if (sv.score >= 5) {
        xepLoai = 'Khá';
      } else {
        xepLoai = 'Kém';
      }
      print('${sv.name} - Điểm: ${sv.score} - Xếp loại: $xepLoai');
    }
    print('===============================\n');
  }
}

void main() {
  // Tạo giáo viên
  var gv1 = Teacher('GV01', 'Thầy Minh', 40, 'Nam', 'Toán', 15000000);
  var gv2 = Teacher('GV02', 'Cô Hoa', 35, 'Nữ', 'Văn', 14000000);

  // Tạo học sinh
  var sv1 = Student('SV01', 'An', 16, 'Nam', '10A', 8.5);
  var sv2 = Student('SV02', 'Bình', 17, 'Nam', '10A', 6.5);
  var sv3 = Student('SV03', 'Chi', 16, 'Nữ', '10A', 9.2);

  // Tạo lớp học
  var lop10A = Classroom('L10A', 'Lớp 10A');

  // Gán giáo viên và thêm học sinh
  lop10A.ganGiaoVien(gv1);
  lop10A.themHocSinh(sv1);
  lop10A.themHocSinh(sv2);
  lop10A.themHocSinh(sv3);

  // Hiển thị thông tin lớp học
  lop10A.hienThiThongTinLop();

  // Hiển thị báo cáo điểm và xếp loại
  lop10A.hienThiBaoCaoDiem();

  // Hiển thị thông tin giáo viên
  print('\n=== Danh sách giáo viên ===');
  gv1.hienThiThongTin();
  gv2.hienThiThongTin();
}
