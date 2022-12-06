void main() {
  final listShape = [
    Rectangle(4, 5),
    Rectangle(6, 5),
    Rectangle(7, 5),
    Rectangle(8, 5),
    Rectangle(3, 5),
    Rectangle(2, 5),
    Rectangle(1, 5),
  ];

  List<double> listChuVi = listShape.map((e) => e.chuVi).toList();
  listChuVi.sort();
  print("Ý 1:\nChu vi nhỏ nhất là: ${listChuVi.first}");
  print("Chu vi lớn nhất là: ${listChuVi.last}\n");

  List<double> listDienTich = listShape.map((e) => e.dienTich).toList();
  listDienTich.sort();
  print("Ý 2:\nDiện tích nhỏ nhất là: ${listDienTich.first}");
  print("Diện tích lớn nhất là: ${listDienTich.last}");
}

/*
- Các trường hợp có thể gặp phải:
1/ User chỉ tạo 1 instance nhưng chưa tính chu vi, diện tích. Nên khi print sẽ bị lỗi.
=> Đã thêm 2 function tinhChuVi() và tinhDienTich vào constructor Rectangle().
2/ User đã tạo 1 instance và tính chu vi, diện tích. Sau đó sửa lại chieuDai hoặc chieuRong,
nhưng lại in thẳng ra chu vi, diện tích mà chưa gọi 2 function tinhChuVi và tinhDienTich() tính lại.
=> Đã thêm vào setter của chieuDai, chieuRong 2 function tinhChuVi() và tinhDienTich().
3/ User thêm chieuDai hoặc chieuRong của factory constructor Rectangle <= 0.
=> Đã thêm if check chieuDai và chieuRong.
4/ User set chieuDai hoặc chieuRong <= 0.
=> Đã thêm throw Exception.
5/ User set chieuDai và chieuRong bằng nhau.
=> Đã thêm throw Exception.
*/
class Rectangle {
  double _chieuDai;
  double _chieuRong;
  double? _chuVi;
  double? _dienTich;

  double get chieuDai => _chieuDai;
  double get chieuRong => _chieuRong;
  double get chuVi => _chuVi!;
  double get dienTich => _dienTich!;

  set chieuDai(double chieuDai) {
    if (chieuDai <= 0) {
      throw Exception("Chiều dài không được nhỏ hơn hoặc bằng 0.");
    } else if (chieuDai <= _chieuRong) {
      throw Exception("Chiều dài không được nhỏ hơn hoặc bằng chiều rộng.");
    } else {
      _chieuDai = chieuDai;
    }

    tinhChuVi();
    tinhDienTich();
  } 

  set chieuRong(double chieuRong) {
    if (chieuRong >= _chieuDai) {
      throw Exception("Chiều rộng không được nhỏ hơn hoặc bằng chiều dài. ");
    } else if (chieuRong <= 0) {
      throw Exception("Chiều rộng không được nhỏ hơn hoặc bằng 0.");
    } else {
      _chieuRong = chieuRong;
    }

    tinhChuVi();
    tinhDienTich();
  } 

  Rectangle._internal(this._chieuDai, this._chieuRong) {
    tinhChuVi();
    tinhDienTich();
  }

  factory Rectangle(double chieuDai, double chieuRong) {
    if (chieuDai <= 0 || chieuRong <= 0) {
      throw Exception("Chiều dài, chiều rộng không được nhỏ hơn hoặc bằng 0.");
    } else if (chieuDai == chieuRong) {
      throw Exception("Chiều dài không được bằng chiều rộng.");
    } else if (chieuDai < chieuRong) {
      double temp = chieuDai;
      chieuDai = chieuRong;
      chieuRong = temp;
    }

    return Rectangle._internal(chieuDai, chieuRong);
  }

  double tinhChuVi() {
    _chuVi = (_chieuDai + _chieuRong) * 2;
    return _chuVi!;
  }

  double tinhDienTich() {
    _dienTich = _chieuDai * _chieuRong;
    return _dienTich!;
  }
}
