class NotificationModel{
  late final int id;
  late final String title, body,time,image;
  NotificationModel
      ({
    required this.image,
    required this.time,
    required this.body,
    required this.title,
    this.id = 0,
      });
}