import 'dart:math';

void main() {
  // 1. Tạo mảng cho các hình:
  final listShape = [
    HinhChuNhat(chieuDai: 8, chieuRong: 3),
    HinhTron(banKinh: 6),
    HinhTamGiac(canh1: 3, canh2: 4, canh3: 5),
    HinhVuong(doDaiCanh: 4)
  ];

  // 2. Tìm phần tử có diện tích lớn nhất, nhỏ nhất.
  List<dynamic> listDienTich = listShape.map((e) => e.dienTich).toList();
  listDienTich.sort();

  print("Hình có diện tích nhỏ nhất là: ${listDienTich.first}");
  print("Hình có diện tích lớn nhất là: ${listDienTich.last}");
}

abstract class Shape {
  double? chuVi;
  double? dienTich;

  void tinhDienTich();
}

class HinhChuNhat extends Shape {
  double chieuDai;
  double chieuRong;

  HinhChuNhat({required this.chieuDai, required this.chieuRong}) {
    tinhDienTich();
  }

  @override
  void tinhDienTich() {
    dienTich = chieuDai * chieuRong;
  }
}

class HinhTron extends Shape {
  double banKinh;

  HinhTron({required this.banKinh}) {
    tinhDienTich();
  }

  @override
  void tinhDienTich() {
    dienTich = pow(banKinh, 2) * 3.14;
  }
}

class HinhTamGiac extends Shape {
  double canh1;
  double canh2;
  double canh3;

  HinhTamGiac({required this.canh1, required this.canh2, required this.canh3}) {
    tinhDienTich();
  }

  @override
  void tinhDienTich() {
    double p = (canh1 + canh2 + canh3) / 2;
    dienTich = sqrt(p*(p - canh1)*(p - canh2)*(p - canh3));
  }
}

class HinhVuong extends Shape {
  double doDaiCanh;

  HinhVuong({required this.doDaiCanh}) {
    tinhDienTich();
  }

  @override
  void tinhDienTich() {
    dienTich = doDaiCanh * doDaiCanh;
  }
}
