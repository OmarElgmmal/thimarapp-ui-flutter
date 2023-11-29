import 'package:flutter/material.dart';
import 'model.dart';


class Item extends StatefulWidget {
  final MyOrderModel model;
  const Item({super.key, required this.model});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

  List<String> images = [
    "https://financialtribune.com/sites/default/files/04-as-fruits_vegetable_exports_709-ab.jpeg",
    "https://blog.pinehurstlaser.com/wp-content/uploads/2018/04/bright-veggies.jpg",
    "https://cdn.shopify.com/s/files/1/2019/9113/collections/Fruits.jpg?v=1527291541",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 16),
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(.02),
            offset: const Offset(0, 6),
            blurRadius: 17,
            blurStyle: BlurStyle.outer
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  widget.model.titles,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                widget.model.body,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    3,
                        (index) => Container(
                          margin: const EdgeInsetsDirectional.only(end: 3,top: 14),
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color(0xff61B80C).withOpacity(.06),
                        border: Border.all(
                          color: const Color(0xff61B80C).withOpacity(.06),
                        ),
                      ),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 14),
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color(0xff61B80C).withOpacity(.06),
                      border: Border.all(
                        color: const Color(0xff61B80C).withOpacity(.06),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "+2",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: const Color(0xff000000).withOpacity(.16),
            thickness: 0.2,
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 3,horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xff61B80C).withOpacity(.06),
                  border: Border.all(
                    color: const Color(0xff61B80C).withOpacity(.06),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.model.text,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                widget.model.price,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
