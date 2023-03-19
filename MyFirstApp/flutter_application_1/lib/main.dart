import 'package:flutter/material.dart';
// ignore: constant_identifier_names
const int SEND = 0;
// ignore: constant_identifier_names
const int RECEIPT = 1;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container( 
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/t1takemyenergy.jpg"), fit : BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Align(child: Icon(Icons.more_horiz))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsets.only(right: 10, bottom: 40),
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Row(children: [
                    const Icon(
                      Icons.food_bank,
                      color: Colors.redAccent,
                      size: 30,
                    ),
                    Column(
                      children: const [
                        Text(
                          'Số dư khả dụng',
                          style: TextStyle(fontSize: 13),
                        ),
                        Text(
                          '499999999',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ]),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    menuMet("Tài khoản và thẻ", Icons.wallet),
                    menuMet("Rút tiền", Icons.attach_money),
                    menuMet("Chuyển tiền", Icons.compare_arrows),
                    menuMet("Mã Qr code", Icons.qr_code_2)
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Lịch sử giao dịch', style: TextStyle(fontWeight: FontWeight.bold),),
                    Icon(Icons.refresh)
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text('Hôm qua, 5 Thg 1, 2023', style: TextStyle(fontSize: 12, color: Color.fromARGB(128, 0, 0, 0)),),
                        ],
                      ),
                      Column(
                        children: [
                          transaction("Truong Bach Chien", "Chien chuyen tien hoc", RECEIPT, "10.000.000"),
                          transaction("Truong Bach Chien", "Thanh toan tien an", SEND, "5.000.000"),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    ));
  }
  ///Giao dịch
  Widget transaction(String name, String content, int status, String money) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              status == RECEIPT ? const Icon(Icons.subdirectory_arrow_right, color: Colors.green,) : const Icon(Icons.subdirectory_arrow_left, color: Colors.redAccent,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold),),
                  Text(content, style: const TextStyle(fontSize: 10, color: Color.fromARGB(128, 0, 0, 0)))
                ],
              ),
            ],
          ),
          Text(status == RECEIPT ? "+ $money" : "- $money", style: const TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }

  ///Thành phần của menu
  Widget menuMet(String content, IconData icon) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
        Icon(icon, color: Colors.redAccent, size: 30),
        Text(
          content,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
