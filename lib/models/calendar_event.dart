class CalendarEvent {
  String eventId;
  String eventDate;
  String eventTime;
  String locationClientName;
  String typeOfMeeting;
  String? categoryId;
  String? folderId;
  String? reminderValue;
  String? reminderDate;
  String? reminderTime;
  String? recordAfterTime;
  String? recordAfterDate;

  CalendarEvent({
    required this.eventId,
    required this.eventDate,
    required this.eventTime,
    required this.locationClientName,
    required this.typeOfMeeting,
    this.categoryId,
    this.folderId,
    this.reminderValue,
    this.reminderDate,
    this.reminderTime,
    this.recordAfterTime,
    this.recordAfterDate
  });

  Map<String, dynamic> toDatabaseJson() => {
    'title': '$locationClientName $eventDate $eventTime',
    'date': eventDate,
    'time': eventTime,
    'location': locationClientName,
    'type_of_meeting': typeOfMeeting,
    'categories_that_may_help': (categoryId != 'choose a category') ? categoryId : '',
    'event_folder': (folderId != 'favorites folder') ? folderId : '',
    'reminder_value': (reminderValue != null) ? reminderValue : null,
    'reminder_date': (reminderDate != null) ? reminderDate : null,
    'reminder_time': (reminderTime != null) ? reminderTime : null,
    'record_after_time': (recordAfterTime != null) ? recordAfterTime : null,
    'record_after_date': (recordAfterDate != null) ? recordAfterDate : null,
  };

  factory CalendarEvent.fromDatabaseJson(Map<String, dynamic> eventMap) => CalendarEvent(
    eventId: eventMap['ID'].toString(),
    eventDate: eventMap['date'],
    eventTime: eventMap['time'],
    locationClientName: eventMap['location'],
    typeOfMeeting: eventMap['type_of_meeting'],
    categoryId: (eventMap['categories_that_may_help'] != null) ? eventMap['categories_that_may_help'][0]['term_id'].toString() : '',
    folderId: (eventMap['event_folder_id'] != null) ? eventMap['event_folder_id'].toString() : '',
    reminderValue: eventMap['reminder_value'],
    reminderDate: eventMap['reminder_date'],
    reminderTime: eventMap['reminder_time'],
  );
}