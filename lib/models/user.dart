import 'package:bight/models/workspace.dart';

class User {
  int id;
  String username;
  String firstName;
  String lastName;
  int? defaultWorkspaceID;
  String? defaultWorkspaceRole;
  String? token;
  String? profileImageUrl;
  String? title;
  String? location;
  String? description;
  int? defaultFavoritesFolder;
  List<dynamic>? userTopics;
  List<Workspace>? workspaces;
  bool? notifyAboutUploads;
  bool? recordAfterMeetings;
  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.defaultWorkspaceID,
    this.defaultWorkspaceRole,
    this.token,
    this.profileImageUrl,
    this.title,
    this.location,
    this.description,
    this.defaultFavoritesFolder,
    this.userTopics,
    this.workspaces,
    this.notifyAboutUploads,
    this.recordAfterMeetings,
  });

  factory User.fromDatabaseJson({required Map<String, dynamic> data, required List<dynamic> topicList, required List<Workspace> workspaceList}) => User(
    id: (data['id'] != null && data['id'] != '') ? data['id'] : data['ID'],
    username: (data['email'] != null) ? data['email'] : data['data']['user_email'],
    firstName: (data['user_meta'] == null) ? data['firstName'] : data['user_meta']['first_name'][0],
    lastName: (data['user_meta'] == null) ? data['lastName'] : data['user_meta']['last_name'][0],
    defaultWorkspaceID: (data['workspace_id'] != null) ? data['workspace_id'] : data['default_workspace_id'] ,
    defaultWorkspaceRole: (data['workspace_role_slug'] != null ) ? data['workspace_role_slug'] : data['workspaces']['${data['default_workspace_id']}']['role'],
    token: data['token'],
    profileImageUrl: (data['image_data'] != false && data['image_data'] != null) ? data['image_data'][0] : "https://bightapps.wpengine.com/wp-content/uploads/2021/07/placeholder-logo.jpg",
    title: (data['user_meta'] != null && data['user_meta']['title'] != null && data['user_meta']['title'].toString() != '[]') ? data['user_meta']['title'][0] :  'New User' ,
    location: (data['user_meta'] != null && data['user_meta']['location'] != null) ? data['user_meta']['location'][0] : (data['location'] != null) ? data['location'] : 'No Location',
    description: (data['user_meta'] == null) ? data['description'] : data['user_meta']['description'][0],
    defaultFavoritesFolder: (data['workspace_id'] != null) ? data['favorites_folder_id'] : data['workspaces']['${data['default_workspace_id']}']['favorites_folder_id'],
    userTopics: topicList,
    workspaces: workspaceList,
    notifyAboutUploads: (data['notify_about_uploads'] != null) ? data['notify_about_uploads'] : false,
    recordAfterMeetings: (data['record_after_meetings'] != null) ? data['record_after_meetings'] : false,
  );

  Map<String, dynamic> toDatabaseJson() => {
    'id': id,
    'username': username,
    'firstName': firstName,
    'lastName': lastName,
    'workspace_id': defaultWorkspaceID,
    'workspace_role_slug': defaultWorkspaceRole,
    'token': token,
    'image': {
      'url': profileImageUrl,
    },
    'notify_about_uploads': notifyAboutUploads,
    'record_after_meetings': recordAfterMeetings,
  };
}

class UserProfile{ //extends User {
  String? location;
  String? description;
  String? title;
  UserProfile({
    // required int id,
    // required String username,
    // required String firstName,
    // required String lastName,
    // required String profileImage,
    this.location,
    this.description,
    this.title,
  }); //: super(id: id, username: username,firstName: firstName, lastName: lastName);

  factory UserProfile.fromDatabaseJson(Map<String, dynamic> data) => UserProfile(
    location: data['user_meta']['location'][0],
    description: data['user_meta']['description'][0],
    title: data['user_meta']['title'][0],
  );
}