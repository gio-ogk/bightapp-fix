import 'package:intl/intl.dart';
class Invite {
  int id;
  String email;
  DateTime sentDate;
  String userType;

  Invite({
    required this.id,
    required this.email,
    required this.sentDate,
    required this.userType,
  });

  factory Invite.fromDatabaseJson(Map<String, dynamic> inviteMap) => Invite(
    id: inviteMap['ID'],
    email: inviteMap['invite_by_email'],
    sentDate: DateFormat('yyyy-MM-dd H:m:s').parse(inviteMap['post_date_gmt']),
    userType: inviteMap['workspace_role_slug'],
  );
}

class InviteRequest{
  int id;
  String email;
  DateTime requestDate;
  String firstName;
  String lastName;

  InviteRequest({
    required this.id,
    required this.email,
    required this.requestDate,
    required this.firstName,
    required this.lastName,
  });

  factory InviteRequest.fromDatabaseJson(Map<String, dynamic> requestMap) => InviteRequest(
    id: requestMap['ID'],
    email: requestMap['request_user_email'],
    requestDate: DateFormat('yyyy-MM-dd H:m:s').parse(requestMap['post_date_gmt']),
    firstName: requestMap['first_name'],
    lastName: requestMap['last_name'],
  );
}