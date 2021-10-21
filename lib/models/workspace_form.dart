class WorkspaceForm {
  String workspaceName;
  String workspaceUserEmail;
  String firstName;
  String lastName;
  String password;
  String phone;
  WorkspaceForm({
    required this.workspaceName,
    required this.workspaceUserEmail,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toDatabaseJson() => {
    'workspace_name': workspaceName,
    'user_email': workspaceUserEmail,
    'user_first_name': firstName,
    'user_last_name': lastName,
    'user_phone': phone,
    'password': password,
  };
}

class WorkspaceFormSuccess {
  bool success;

  WorkspaceFormSuccess({required this.success});

  factory WorkspaceFormSuccess.fromJson(Map<String, dynamic> json) {
    return WorkspaceFormSuccess(success: json['success']);
  }
}
