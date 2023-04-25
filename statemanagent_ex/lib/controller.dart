import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnhTaiTextField {
  AnhTaiTextField(this.initContent);
  String initContent;
  final attfController = TextEditingController();
}

class Items with ChangeNotifier, DiagnosticableTreeMixin {
  List<AnhTaiTextField> items = <AnhTaiTextField>[];
  void addItem(AnhTaiTextField value) {
    items.add(value);
    notifyListeners();
  }

  void removeItem(AnhTaiTextField value) {
    items.remove(value);
    notifyListeners();
  }
  void change() {
    notifyListeners();
  }
}
