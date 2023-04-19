import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'customer.dart';
import 'vietnam_provinces.dart';

class AddCustiomerScreen extends StatelessWidget {
  AddCustiomerScreen({super.key, required this.customers});
  final List<Customer> customers;

  final _formKey = GlobalKey<FormState>();
  final _hoVaTenController = TextEditingController();
  int _loaiKhachValue = 1;
  final _soDienThoaiController = TextEditingController();
  String? _selectedProvice;
  final _quanHuyenController = TextEditingController();
  final _diaChiController = TextEditingController();
  final _maSoThueController = TextEditingController();
  final _canCuocCongDanController = TextEditingController();
  final _emailController = TextEditingController();
  final _moTaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tên khách hàng'),
                TextFormField(
                  controller: _hoVaTenController,
                  decoration: InputDecoration(
                    hintText: 'Ví dụ: Nguyễn Văn A',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tên khách hàng không được trống';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Loại khách hàng'),
                DropdownButtonFormField<int>(
                  value: _loaiKhachValue,
                  items: [
                    DropdownMenuItem(
                      value: 1,
                      child: Text('Khách hàng'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('Khách hàng và nhà cung cấp'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('Nhà cung cấp'),
                    )
                  ],
                  onChanged: (value) {
                    _loaiKhachValue = value!;
                  },
                  validator: (value) {},
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Số điện thoại'),
                TextFormField(
                  controller: _soDienThoaiController,
                  decoration: InputDecoration(
                    hintText: 'Ví dụ: 0912345678',
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (int.tryParse(value) == null) {
                        return 'Số điện thoại chỉ bao gồm chữ số';
                      }
                      if (value.length < 10 || value.length > 14) {
                        return 'Số điện thoại phải từ 10 đến 14 chữ số';
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Tỉnh/Thành phố'),
                DropdownButtonFormField<String>(
                  items:
                      vietnamProvinces.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _selectedProvice = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tỉnh/Thành phố không được trống';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Quận/Huyện'),
                TextFormField(
                  controller: _quanHuyenController,
                  decoration: InputDecoration(
                    hintText: 'Ví dụ: Mễ Trì',
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Địa chỉ'),
                TextFormField(
                  controller: _diaChiController,
                  decoration: InputDecoration(
                    hintText: 'Ví dụ: số 8 Phạm Hùng',
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Mã số thuế'),
                TextFormField(
                  controller: _maSoThueController,
                  decoration: InputDecoration(
                    hintText: 'Ví dụ: 0105987432',
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (int.tryParse(value) == null) {
                        return 'Mã số thuế chỉ bao gồm chữ số';
                      }
                      if (value.length < 10 || value.length > 13) {
                        return 'Mã số thuế phải từ 10 đến 13 chữ số';
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Căn cước công dân'),
                TextFormField(
                  controller: _canCuocCongDanController,
                  decoration: InputDecoration(
                    hintText: 'Ví dụ: 0080321345',
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (int.tryParse(value) == null) {
                        return 'Căn cước công dân chỉ bao gồm chữ số';
                      }
                      if (value.length != 9 && value.length != 12) {
                        return 'Căn cước công dân phải gồm 9 hoặc 12 chữ số';
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Email'),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Ví dụ: softdream@gmail.com',
                  ),
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        !value.isValidEmail()) {
                      return 'Email không đúng định dạng';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Mô tả'),
                TextFormField(
                  controller: _moTaController,
                  decoration: InputDecoration(
                    hintText: 'Ví dụ: Chuyên gia bán các loại hàng gia dụng',
                  ),
                  validator: (value) {},
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(
            child: Text('Thêm'),
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              customers.add(
                Customer(
                  name: _hoVaTenController.text,
                  type: _loaiKhachValue,
                  city: _selectedProvice!,
                  district: _quanHuyenController.text,
                  phoneNumber: _soDienThoaiController.text,
                  address: _diaChiController.text,
                  email: _emailController.text,
                  taxcode: _maSoThueController.text,
                  idNumber: _canCuocCongDanController.text,
                  description: _moTaController.text,
                ),
              );
              Navigator.pop(
                context,
              );
            },
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
