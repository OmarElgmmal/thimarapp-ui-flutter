class MyOrderModel{
  late int id;
  late final String titles,body,text,price;

  MyOrderModel
      ({
    this.id = 0,
    required this.price,
    required this.titles,
    required this.body,
    required this.text,
      });
}