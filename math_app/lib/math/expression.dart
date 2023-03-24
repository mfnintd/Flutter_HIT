import 'dart:math';

class Expression {
  int num1 = 0;
  int num2 = 0;
  int num3 = 0;
  /// 0 : +
  String sign = '+';
  bool isCorrect = true;
  static const List<int> delta = [1, -1, 10, 10, 10, -10, -10, -10, -2, -3, 2, 3];
  static const List<String> signs = ['+', '-', '*', '/'];
  Expression() {
    num1 = Random().nextInt(50) + 1;
    num2 = Random().nextInt(50) + 1;
    isCorrect = Random().nextBool();
    sign = signs[Random().nextInt(signs.length)];
    switch (sign) {
      case '+':
      case '-':
        num3 = num1 + num2;
        break;
      case '*':
      case '/':
        num3 = num1 * num2;
        break;
    }
    if (sign == '-' || sign == '/') {
      ///Đổi giá trị num1 và num3;
      int tmp = num1;
      num1 = num3;
      num3 = tmp;
    }
    if (!isCorrect) {
      num3 += delta[Random().nextInt(delta.length)];
    }
  }
  @override
  String toString() {
    return '$num1$sign$num2=$num3';
  }
}