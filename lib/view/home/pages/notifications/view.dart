import 'package:flutter/material.dart';
import 'custom_notification.dart';
import 'model.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<NotificationModel> list = [
    NotificationModel(
        image: "https://img.freepik.com/free-vector/push-notifications-concept-illustration_114360-4986.jpg?w=740&t=st=1697606531~exp=1697607131~hmac=c298cedbca36104a6ee877660fbe3eeb582b7be6a7ba54cde0ee2aa0a5d32b85",
        time: "منذ ساعتان",
        body: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
        title: "تم قبول طلبك وجاري تحضيره الأن",
    ),
    NotificationModel(
      image: "https://img.freepik.com/free-vector/alert-concept-illustration_114360-238.jpg?w=740&t=st=1697607703~exp=1697608303~hmac=3be3094888fa6c1ae5e164768cd2b81debcee0fbce18afd05f18aeef8b0a3067",
      time: "منذ ساعتان ونص",
      body: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      title: "رسالة إدارية",
    ),
    NotificationModel(
      image: "https://img.freepik.com/free-vector/push-notifications-concept-illustration_114360-4730.jpg?w=740&t=st=1697607793~exp=1697608393~hmac=09b4ecefabf1831f4bdf5f1f1ea49fc83b01bb05200d7e93fb24bbf4ad70f0f3",
      time: "منذ ساعه",
      body: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      title: "عروض جديدة بإنتظارك",
    ),
  ];

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData()async{
    await Future.delayed(const Duration(seconds: 3),);
    isLoading = false;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الإشعارات",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading?const Center(
        child: CircularProgressIndicator(),)
          :ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => ItemNotification(model: list[index],),
        itemCount: list.length,
      ),
    );
  }
}


