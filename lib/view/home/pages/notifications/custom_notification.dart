import 'package:flutter/material.dart';
import 'model.dart';


class ItemNotification extends StatelessWidget {
  final NotificationModel model;
  const ItemNotification({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            height: 33,
            width: 33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Theme.of(context).primaryColor.withOpacity(.13),
              border: Border.all(
                color: const Color(0xffFFFFFF).withOpacity(.14),
              ),
            ),
            child: Image.network(
              model.image,
              height: 20,
              width: 20,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                Text(
                  model.body,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
                Text(
                  model.time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
