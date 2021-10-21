class NotificationItem{
  int id;
  String route;
  int? folderId;
  String? categoryId;
  int? eventId;
  int? bightId;
  bool seen;
  String description;
  String postDate;

  NotificationItem({
    required this.id,
    required this.route,
    this.folderId,
    this.categoryId,
    this.eventId,
    this.bightId,
    required this.seen,
    required this.description,
    required this.postDate
  });

  factory NotificationItem.fromDatabaseJson({required Map<String, dynamic> notificationMap}) =>
      NotificationItem(
        id: notificationMap['id'],
        route: notificationMap['route'],
        folderId: (notificationMap['folder_id'] != null && notificationMap['folder_id'] != '') ? int.parse(notificationMap['folder_id']) : null,
        categoryId:notificationMap['category_id'],
        eventId: (notificationMap['event_id'] != null && notificationMap['event_id'] != '') ? int.parse(notificationMap['event_id']) : null,
        bightId: (notificationMap['bight_id'] != null && notificationMap['bight_id'] != '') ? int.parse(notificationMap['bight_id']) : null,
        seen: notificationMap['seen'],
        description: notificationMap['description'],
        postDate: notificationMap['post_date'],
      );
}