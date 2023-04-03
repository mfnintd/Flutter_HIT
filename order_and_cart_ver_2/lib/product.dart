class Product {
  final String picture;
  final String name;
  final String description;
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
}