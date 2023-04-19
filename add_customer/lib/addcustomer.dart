import 'package:flutter/material.dart';
import 'customer.dart';
import 'vietnam_provinces.dart';

class AddCustomerScreen extends StatelessWidget {
  const AddCustomerScreen({super.key, required this.customers});
  final List<Customer> customers;

  @override
  Widget build(BuildContext context) {
    int loaiKhachValue = 1;
    String? selectedProvice;
    final formKey = GlobalKey<FormState>();
    final hoVaTenController = TextEditingController();
    final soDienThoaiController = TextEditingController();
    final quanHuyenController = TextEditingController();
    final diaChiController = TextEditingController();
    final maSoThueController = TextEditingController();
    final canCuocCongDanController = TextEditingController();
    final emailController = TextEditingController();
    final moTaController = TextEditingController();
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tên khách hàng'),
                TextFormField(
                  controller: hoVaTenController,
                  decoration: const InputDecoration(
                    hintText: 'Ví dụ: Nguyễn Văn A',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tên khách hàng không được trống';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text('Loại khách hàng'),
                DropdownButtonFormField<int>(
                  value: loaiKhachValue,
                  items: const [
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
                    loaiKhachValue = value!;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text('Số điện thoại'),
                TextFormField(
                  controller: soDienThoaiController,
                  decoration: const InputDecoration(
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
                const SizedBox(
                  height: 8,
                ),
                const Text('Tỉnh/Thành phố'),
                DropdownButtonFormField<String>(
                  items:
                      vietnamProvinces.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedProvice = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tỉnh/Thành phố không được trống';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text('Quận/Huyện'),
                TextFormField(
                  controller: quanHuyenController,
                  decoration: const InputDecoration(
                    hintText: 'Ví dụ: Mễ Trì',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text('Địa chỉ'),
                TextFormField(
                  controller: diaChiController,
                  decoration: const InputDecoration(
                    hintText: 'Ví dụ: số 8 Phạm Hùng',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text('Mã số thuế'),
                TextFormField(
                  controller: maSoThueController,
                  decoration: const InputDecoration(
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
                const SizedBox(
                  height: 8,
                ),
                const Text('Căn cước công dân'),
                TextFormField(
                  controller: canCuocCongDanController,
                  decoration: const InputDecoration(
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
                const SizedBox(
                  height: 8,
                ),
                const Text('Email'),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
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
                const SizedBox(
                  height: 8,
                ),
                const Text('Mô tả'),
                TextFormField(
                  controller: moTaController,
                  decoration: const InputDecoration(
                    hintText: 'Ví dụ: Chuyên gia bán các loại hàng gia dụng',
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
            child: const Text('Thêm'),
            onPressed: () {
              if (!formKey.currentState!.validate()) {
                return;
              }
              customers.add(
                Customer(
                  name: hoVaTenController.text,
                  type: loaiKhachValue,
                  city: selectedProvice!,
                  district: quanHuyenController.text,
                  phoneNumber: soDienThoaiController.text,
                  address: diaChiController.text,
                  email: emailController.text,
                  taxcode: maSoThueController.text,
                  idNumber: canCuocCongDanController.text,
                  description: moTaController.text,
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
