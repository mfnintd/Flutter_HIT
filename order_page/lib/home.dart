import 'package:flutter/material.dart';
import 'package:order_page/product.dart';
import 'order.dart';
import 'contants.dart';
import 'global_variable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: content(),
        bottomNavigationBar: botNav(context),
      ),
    );
  }

  ListView content() {
    return ListView(
        children: [
          title('THÊM BẠN THÊM VUI - MUA 2 TẶNG 1'),
          for (int index = 0; index < discountProducts.length; index++) 
            productDisplay(discountProducts[index]),
          title('SIGNATURE'),
          for (int index = 0; index < products.length; index++) 
            productDisplay(products[index]),
        ],
      );
  }

  Widget productDisplay(Product product) {
    return Container(
      padding: const EdgeInsets.all(AppSize.smallPadding),
      child: Container(
        height: AppSize.productHeight,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black, 
              width: 1,
            )
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: AppSize.imageSize,
              width: AppSize.imageSize,
              margin: const EdgeInsets.only(right: AppSize.smallMargin),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(product.picture)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: AppSize.normalText,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      if (product.description.isNotEmpty) Text(
                        product.description,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: AppSize.normalText,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          if (product.numberOfLike != 0) SizedBox(
                            width: AppSize.likeRange,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: const Icon(
                                    Icons.thumb_up,
                                    size: AppSize.smallText,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  product.numberOfLike <= 100 ? product.numberOfLike.toString() : '100+',
                                  style: const TextStyle(
                                    fontSize: AppSize.smallText,
                                    color: Colors.grey
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (product.numberSold != 0) Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: const Icon(
                                  Icons.shopping_cart,
                                    size: AppSize.smallText,
                                    color: Colors.grey,
                                )
                              ),
                              Text(
                                'Đã bán ${product.numberSold <= 100 ? product.numberSold.toString() : '100+'}',
                                  style: const TextStyle(
                                    fontSize: AppSize.smallText,
                                    color: Colors.grey
                                  ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${product.reducedPrice}đ ',
                            style: const TextStyle(
                              fontSize: AppSize.normalText,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          if (product.reducedPrice != product.cost) Text(
                            '${product.cost}đ',
                            style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (product.numberInCart != 0) TextButton(
                            style: ElevatedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            ///Nhấn nút remove
                            onPressed: () {
                              setState(() {
                                product.remove();
                              });
                            }, 
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey,
                              height: AppSize.buttonSize,
                              width: AppSize.buttonSize,
                              child: const Text(
                                '-',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ),
                          if (product.numberInCart != 0) Text(
                            product.numberInCart.toString(),
                          ),
                          TextButton(
                            style: ElevatedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            ///Nhấn nút add
                            onPressed: () {
                              setState(() {
                                product.add();
                              });
                            }, 
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.orangeAccent,
                              height: AppSize.buttonSize,
                              width: AppSize.buttonSize,
                              child: const Text(
                                '+',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget title(String content) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(AppSize.largePadding),
      child: Row(
        children: [
            Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSize.normalText,
              ),
            ),
        ],
      ),
    );
  }

  Widget botNav(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: AppSize.smallPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.grey,
              padding: const EdgeInsets.symmetric(
                vertical: AppSize.smallPadding, 
                horizontal: AppSize.largePadding
              ),
              child: Row(
                children: [
                  const Icon(Icons.shopping_cart),
                  Text('$numberOfProductType'),
                ],
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.orangeAccent),
              ),
              ///Chuyển qua màn hình xem đơn hàng
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const OrderScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSize.smallPadding, 
                  horizontal: AppSize.largePadding
                ),
                child: Text(
                  'Xem đơn hàng - $totalPriceđ',
                  style: const TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
            )
          ],
        ),
      );
  }
}
