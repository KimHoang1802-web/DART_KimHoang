/*
Bài 1: Quản lý thông tin sinh viên
Yêu cầu:
1.Tạo lớp Student với các thuộc tính: id, name, age, grade.
2.Viết các phương thức:
Nhập thông tin sinh viên.
Hiển thị thông tin sinh viên.
Viết chương trình quản lý danh sách sinh viên: thêm mới, hiển thị danh
sách, và tìm kiếm sinh viên theo ID.
 */
import 'dart:io';

class Student {
  int id;
  String name;
  int age;
  double grade;

  Student(this.id, this.name, this.age, this.grade);

  void displayInfo(){
    print('ID: $id ');
    print('hoTenSinhVien: $name');
    print('Tuoi: $age');
    print('Diem: $grade');
  }
}

void main() {
    List<Student> studentList = [];
    while(true){
    print('\n========= Danh Sách Các Chức Năng =========');
    print('1. Thêm sinh viên mới');
    print('2. Hiển thị danh sách sinh viên');
    print('3. Tìm kiếm sinh viên theo ID');
    print('4. Thoát');
    print('Chọn chức năng:');
    String? choice = stdin.readLineSync();

    switch(choice){
      case '1':
        print('Nhập ID sinh viên:');
        int id = int.parse(stdin.readLineSync()!);
        print('Nhập tên sinh viên:');
        String name = stdin.readLineSync()!;
        print('Nhập tuổi sinh viên:');
        int age = int.parse(stdin.readLineSync()!);
        print('Nhập điểm sinh viên:');
        double grade = double.parse(stdin.readLineSync()!);

        Student student = Student(id, name, age, grade);
        studentList.add(student);
        print('Đã thêm sinh viên mới thành công');
        break;

      case '2':
        print('Danh sách sinh viên:');
        for (var student in studentList) {
          student.displayInfo();
          print('-------------------');
        }
        break;

      case '3':
        print('Nhập ID sinh viên cần tìm kiếm:');
        int searchId = int.parse(stdin.readLineSync()!);
        bool found = false;
        for (var student in studentList) {
          if (student.id == searchId) {
            student.displayInfo();
            found = true;
            break;
          }
        }
        if (!found) {
          print('Không tìm thấy sinh viên với ID $searchId');
        }
        break;

      case '4':
        print('Thoát chương trình.');
        return;

      default:
        print('Lựa chọn không hợp lệ. Vui lòng chọn lại.'); 
    }
    }
}