import 'package:flutter/material.dart';

class RateProducts extends StatelessWidget {
  const RateProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تقييم المنتجات"),
        leading: Container(
          margin: const EdgeInsets.all(8),
          //padding: EdgeInsets.all(16),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color(0xff4C8613).withOpacity(.13),
          ),
          child: IconButton(
            padding: const EdgeInsets.only(right: 10),
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 285,
            width: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 150),
                      width: 75,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColor.withOpacity(.13),
                        border: Border.all(
                          color: const Color(0xff000000).withOpacity(.16),
                        ),
                      ),
                      child: Image.network(
                        "https://img.freepik.com/free-photo/hand-holding-ripe-tomato-freshness-generated-by-ai_24640-80303.jpg?t=st=1698211241~exp=1698214841~hmac=2c3bd8de7698a3f1488580c46eb64f246e16450f43a6c0e569f7d10daddb13d2&w=1380",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "طماطم",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const Text(
                          "السعر / 1كجم",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "45 ر.س",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                            children: const [
                              TextSpan(
                                text: "56 ر.س",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "تعليق المنتج",
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
