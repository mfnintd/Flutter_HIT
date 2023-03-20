import 'package:flutter/material.dart';
// ignore: constant_identifier_names
const int AN_UONG = 0;
// ignore: constant_identifier_names
const int LUONG = 1;
// ignore: constant_identifier_names
const int TRA_NO = 2;
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 203, 203, 203),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: [
                        const SizedBox(width: 40,),
                        Column(children: [
                          Column(children: const [
                            Text("Số dư"),
                            Text('-8,700,000 đ', style: TextStyle(fontWeight: FontWeight.bold),)
                          ],),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 200, 200, 200),
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Row(children: const [
                              Icon(Icons.public),
                              Text(" Tổng cộng ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Icon(Icons.arrow_drop_down)
                            ],),
                          )
                        ],),
                        Container(
                          alignment: Alignment.topRight,
                          child: Row(children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: const Icon(Icons.search)
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: const Icon(Icons.more_vert)
                            ),
                          ]),
                        )
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 2.0, color: Colors.transparent))),
                            child: const Text("THÁNG TRƯỚC", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            margin: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 2.0, color: Colors.black))),
                            child: const Text("THÁNG NÀY", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            margin: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 2.0, color: Colors.transparent))),
                            child: const Text("TƯƠNG LAI", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                          ),
                      ],)
                    ],)
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(children: [
                      moneyOfDate('Thứ năm', 16, 3, 2023, '-7,700,000'),
                      spending(AN_UONG, 'với a Tài & 2 người khác', '500,000'),
                      spending(AN_UONG, '', '5,000,000'),
                      spending(LUONG, '', '8,000,000'),
                      spending(TRA_NO, 'Trả nợ cho ai đó', '10,000,000'),
                      spending(AN_UONG, '', '200,000')
                    ]),
                  ),
                ],
              ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  bottomMenu(Icons.home, 'Tổng quan', false),
                  bottomMenu(Icons.book, 'Sổ giao dịch', true),
                  bottomMenu(Icons.account_balance, 'Sổ giao dịch', false),
                  bottomMenu(Icons.person, 'Tài khoản', false)
                ],
              )
            )
          ]),
        ),
      ),
    );
  }
  Widget bottomMenu(IconData icon, String content, bool choosed) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        Icon(icon, color: choosed ? Colors.black : Colors.grey,),
        Text(content, style: TextStyle(color: choosed ? Colors.black : Colors.grey),)
      ],)
    );
  }
  Widget moneyOfDate(String thu, int day, int month, int year, String money) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color.fromARGB(128, 0, 0, 0)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Text('$day', style: const TextStyle(fontSize: 40),)
              ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(thu),
                Text('tháng $month $year', style: const TextStyle(fontSize: 11, color: Color.fromARGB(255, 113, 113, 113)),)
              ],)
            ]
          ),
          Text(money, style: const TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
  Widget spending(int status, String content, String money) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.all(10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/${status == AN_UONG ? "anuong.jpg" : status == LUONG ? "luong.jpg" : "trano.jpg"}')), shape: BoxShape.circle),
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(border:Border.all(color: Colors.white, width: 2.0), image: const DecorationImage(image: AssetImage('assets/status.jpg')), shape: BoxShape.circle),
                )
              ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(status == AN_UONG ? "Ăn uống" : status == LUONG ? "Lương" : "Trả nợ", style: const TextStyle(fontWeight: FontWeight.bold),),
                Text(content, style: const TextStyle(fontSize: 11, color: Color.fromARGB(255, 113, 113, 113)),)
              ],)
            ],
          ),
          Text(money, style: TextStyle(color: status == LUONG ? Colors.blue : Colors.red, fontWeight: FontWeight.bold),)
        ],
      )
    );
  }
}
