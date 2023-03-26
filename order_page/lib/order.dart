import 'package:flutter/material.dart';
import 'contants.dart';
import 'global_variable.dart';
import 'product.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            title('ĐƠN HÀNG'),
            for (int index = 0; index < discountProducts.length; index++)
              if (discountProducts[index].numberInCart != 0)
                productDisplay(discountProducts[index]),
            for (int index = 0; index < products.length; index++)
              if (products[index].numberInCart != 0)
                productDisplay(products[index]),
          ],
        ),
        bottomNavigationBar: botNav(context),
      ),
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
                          Text(
                            'Số lượng: ${product.numberInCart}',
                            style: const TextStyle(
                              fontSize: AppSize.normalText,
                              fontWeight: FontWeight.bold,
                            ),
                          )
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
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSize.smallPadding, 
                  horizontal: AppSize.largePadding
                ),
                child: const Text(
                  'Quay lại',
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.orangeAccent,
              padding: const EdgeInsets.symmetric(
                vertical: AppSize.smallPadding, 
                horizontal: AppSize.largePadding
              ),
              child: Text(
                'Tổng: $totalPriceđ',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      );
  }
}