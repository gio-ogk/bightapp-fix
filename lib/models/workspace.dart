class Workspace {
  int workspaceId;
  String workspaceName;
  String workspaceLogoUrl;
  List<dynamic> workspaceQuestions;
  String favoriteFolder;
  String? role;

  Workspace({
    required this.workspaceId,
    required this.workspaceName,
    required this.workspaceLogoUrl,
    required this.workspaceQuestions,
    required this.favoriteFolder,
    this.role,
  });

  factory Workspace.fromDatabaseJson(Map<String, dynamic> workspaceData, List<dynamic> spoonQuestions) => Workspace(
    workspaceId: workspaceData['ID'],
    workspaceName: workspaceData['post_title'],
    workspaceLogoUrl: (workspaceData['logo'] != false && workspaceData['logo'] != null) ? workspaceData['logo']['sizes']['thumbnail'] : '',
    workspaceQuestions: spoonQuestions,
    favoriteFolder: (workspaceData['favorites_folder_id'] != null && workspaceData['favorites_folder_id'] != '') ? workspaceData['favorites_folder_id'] : '',
  );
}