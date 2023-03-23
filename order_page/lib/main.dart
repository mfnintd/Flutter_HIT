import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

const double bottomBarHeight = 50;

void main() {
  runApp(const MainApp());
}

///App
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}

///Page chính
class MainPage extends StatefulWidget {
  const MainPage({super.key});
  
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                CustomContentTitle('THÊM BẠN THÊM VUI - MUA 2 TẶNG 1'),
                Product('assets/trasua.jpg', 'Thêm bạn thêm Vui - Mua 2 Tặng 1', '', 0, 3, 79000, 107000,0),
                CustomContentTitle('SIGNATURE'),
                Product('assets/trasua.jpg', 'Thêm bạn thêm Vui - Mua 2 Tặng 1', '', 0, 3, 79000, 107000,0),
                Product('assets/trasua.jpg', 'Thêm bạn thêm Vui - Mua 2 Tặng 1', '', 0, 3, 79000, 107000,0),
                Product('assets/trasua.jpg', 'Thêm bạn thêm Vui - Mua 2 Tặng 1', '', 0, 3, 79000, 107000,0),

              ],
            ),
          ]
        ),
      ),
      
      bottomNavigationBar: BottomBar(),
    );
  }
}

///Tiêu đề
class CustomContentTitle extends StatelessWidget {
  String content;

  CustomContentTitle(this.content, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            content,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    );
  }
}

///Sản phẩm
class Product extends StatefulWidget {
  String pathOfImage;
  String name;
  String describe;
  int numberOfLike;
  int sold;
  int discount;
  int price;
  int numberInCart;
  Product(this.pathOfImage, this.name, this.describe, this.numberOfLike, this.sold, this.discount, this.price, this.numberInCart, {super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {

  @override

  void pressAddButton() {
    setState(() {
      widget.numberInCart++;
    });
  }
  void pressRemoveButton() {
    setState(() {
      widget.numberInCart--;
      if (widget.numberInCart < 0) {
        widget.numberInCart = 0;
      }
    });
  }
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 140,
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
        ),
        child: 
        Expanded(
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.pathOfImage)),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name, 
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (widget.describe.isNotEmpty) Text(
                          widget.describe,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11
                          ),
                        ),
                        Row(children: [
                          if (widget.numberOfLike != 0)
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: 
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Icons.thumb_up,
                                      size: 11,
                                      //color: Colors.grey,
                                    ),
                                  ),
                                  Text('${widget.numberOfLike}')
                                ],
                              ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.shopping_cart,
                              size: 11,
                              //color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Đã bán ${widget.sold}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row( children: [
                            Text(
                              '${widget.discount}đ ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            if (widget.discount != widget.price) Text(
                              '${widget.price}đ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough
                              ),
                            ),
                          ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (widget.numberInCart != 0) ElevatedButton(
                                onPressed: () {
                                  pressRemoveButton();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0), // set to 0 for square shape
                                  ),
                                  backgroundColor: Colors.grey,
                                  minimumSize: ui.Size.square(30),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 12,
                                ),
                              ),

                              if (widget.numberInCart != 0) Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  '${widget.numberInCart}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ),

                              ElevatedButton(
                                onPressed: () {
                                  pressAddButton();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0), // set to 0 for square shape
                                  ),
                                  backgroundColor: Colors.orange,
                                  minimumSize: ui.Size.square(30),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 12,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///Thanh dưới
class BottomBar extends StatelessWidget {
  BottomBar({
    super.key,
  });

  @override
  int numberOfProduct = 0;
  int totalPrice = 0;

  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      child: Container (
        color: Colors.white,
        height: bottomBarHeight,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                color: Colors.grey,
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 14,
                    ),
                    Text(
                      '  $numberOfProduct',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderedPage())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: Text(
                    'Xem đơn hàng - $totalPrice',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
            ],
          ),
        ),
      )
    );
  }
}

///Trang xem đơn hàng
class OrderedPage extends StatelessWidget {
  const OrderedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Nhấn nè"),
          )
        ]),
      ),
    );
  }
}