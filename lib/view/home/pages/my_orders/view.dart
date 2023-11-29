import 'package:flutter/material.dart';
import 'package:thimar_app/view/home/pages/my_orders/custom_order.dart';
import 'model.dart';


class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {

  List<MyOrderModel> list = [
    MyOrderModel(
        price: "390ر.س",
        titles: "طلب #4587",
        body: "27يونيو,2021,",
        text: "بإنتظار الموافقة",
    ),
    MyOrderModel(
      price: "90ر.س",
      titles: "طلب #4587",
      body: "17يونيو,2021,",
      text: "جاري التحضير",
    ),
    MyOrderModel(
      price: "190ر.س",
      titles: "طلب #4587",
      body: "19يونيو,2021,",
      text: "في الطريق",
    ),
    MyOrderModel(
      price: "290ر.س",
      titles: "طلب #4587",
      body: "29يونيو,2021,",
      text: "بإنتظار الموافقة",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "طلباتي",
        ),
      ),
      body: ListView.builder
        (padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => Item(model: list[index],),
        itemCount: list.length,
      ),
    );
  }
}
