class Fruit {
  String name;
  List<int> price = [];
  String imageReference = "";

  Fruit(this.name);

  int getTotalPrice(){
    var total = 0;
    for (var element in price) { total += element;}
    return total;
  }

  @override
  String toString() {
    return '{nama: $name, price: $price, image: $imageReference}';
  }
}
