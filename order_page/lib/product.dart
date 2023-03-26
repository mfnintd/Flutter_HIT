import 'global_variable.dart';
class Product {
  String picture = '';
  String name = '';
  String description = '';
  int numberOfLike = 0;
  int numberSold = 0;
  int reducedPrice = 0;
  int cost = 0;
  int numberInCart = 0;
  Product(
    this.picture, 
    this.name, 
    this.description, 
    this.numberOfLike, 
    this.numberSold,
    this.reducedPrice,
    this.cost,
    this.numberInCart
  );
  void add() {
    numberInCart++;
    totalPrice += reducedPrice;
    if (numberInCart == 1) {
      numberOfProductType++;
    }
  }
  void remove() {
    numberInCart--;
    totalPrice -= reducedPrice;
    if (numberInCart == 0) {
      numberOfProductType--;
    }
  }
}