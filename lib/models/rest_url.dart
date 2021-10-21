class RestURL {
  static const String baseURL = "http://bightapps.wpengine.com";
  //static const String baseURL = "https://dev.bightapp.com";
  //Auth
  static const String loginRoute =
      baseURL + "/wp-json/jwt-auth/v1/token"; // Login Route
  static const String createWorkspaceRoute =
      baseURL + "/wp-json/bight/workspace_create"; // Create Workspace Route
  static const String validateToken =
      baseURL + "/wp-json/jwt-auth/v1/token/validate";

  //Bights
  static const String getBightsRoute =
      baseURL + "/wp-json/bight/bight_get"; //Get Bights Route
  static const String getFavoritesRoute =
      baseURL + "/wp-json/bight/folder_get"; // Get Folders Route
  static const String bightCreateRoute =
      baseURL + "/wp-json/bight/bight_create";
  static const String bightEditRoute =
      baseURL + "/wp-json/bight/bight_edit";
  static const String getBightCategories =
      baseURL + "/wp-json/bight/bight_get_categories";
  static const String bightDelete =
      baseURL + "/wp-json/bight/bight_delete";
  static const String bightGetLikes =
      baseURL + "/wp-json/bight/bight_get_likes";
  static const String bightCreatePublicLink =
      baseURL + "/wp-json/bight/bight_create_share_link";
  static const String bightGetPublicLink =
      baseURL + "/wp-json/bight/public_share_link_get";

  //Bight Actions
  static const String bightLike =
      baseURL + "/wp-json/bight/bight_like";
  static const String bightDislike =
      baseURL + "/wp-json/bight/bight_dislike";
  static const String bightPin =
      baseURL + "/wp-json/bight/bight_pin";
  static const String bightView =
      baseURL + "/wp-json/bight/bight_increase_views";

  //Quote
  static const String getQuoteRoute =
      baseURL + "/wp-json/bight/quote_get"; // Get Quote Route

  //Account
  static const String workspaceDeleteRoute =
      baseURL + "/wp-json/bight/workspace_delete";
  static const String accountEditRoute =
      baseURL + "/wp-json/bight/account_edit"; // Account Edit Route
  static const String accountGetRoute =
      baseURL + "/wp-json/bight/account_get";
  static const String passwordResetRequest =
      baseURL + "/wp-json/bight/account_pw_reset_request";
  static const String passwordResetSubmit =
      baseURL + "/wp-json/bight/account_pw_reset";

  //Search
  static const String workspaceSearchRoute =
      baseURL + "/wp-json/bight/workspace_search";
  static const String userGetRoute =
      baseURL + "/wp-json/bight/user_get";

  //Media Upload
  static const String mediaUploadRoute =
      baseURL + "/wp-json/wp/v2/media/";

  //Folders
  static const String getFolders =
      baseURL + "/wp-json/bight/folder_get";
  static const String createFolder =
      baseURL + "/wp-json/bight/folder_create";
  static const String addRemoveBightToFolder =
      baseURL + "/wp-json/bight/folder_add_remove_video";
  static const String deleteFolder =
      baseURL + "/wp-json/bight/folder_delete";
  static const String editFolder =
      baseURL + "/wp-json/bight/folder_edit";

  //Calendar Events
  static const String createCalendarEvent =
      baseURL + "/wp-json/bight/calendar_event_create";
  static const String getCalendarEvent =
      baseURL + "/wp-json/bight/calendar_event_get";
  static const String deleteCalendarEvent =
    baseURL + "/wp-json/bight/calendar_event_delete";
  static const String editCalendarEvent =
    baseURL + "/wp-json/bight/calendar_event_edit";

  //Workspace
  static const String addUser =
      baseURL + "/wp-json/bight/workspace_add_user";
  static const String userRemove =
      baseURL + "/wp-json/bight/workspace_remove_user";
  static const String editWorkspace =
      baseURL + "/wp-json/bight/workspace_edit";
  static const String inviteToWorkspace =
      baseURL + "/wp-json/bight/invite_to_workspace";
  static const String inviteGet =
      baseURL + "/wp-json/bight/invite_get";
  static const String inviteAccept =
      baseURL + "/wp-json/bight/invite_accept";
  static const String inviteGetWorkspace =
      baseURL + "/wp-json/bight/invite_get_workspace";
  static const String workspaceSearchPublic =
      baseURL + "/wp-json/bight/workspace_find";
  static const String getWorkspace =
      baseURL + "/wp-json/bight/workspace_get";

  //Invite
  static const String inviteRequest =
      baseURL + "/wp-json/bight/invite_request";
  static const String inviteRequestGet =
      baseURL + "/wp-json/bight/invite_request_get_workspace";
  static const String inviteRequestResponse =
      baseURL + "/wp-json/bight/invite_request_response";
  static const inviteDelete =
      baseURL + "/wp-json/bight/invite_delete";

  //Spoon
  static const spoonSetsGet =
      baseURL + "/wp-json/bight/spoon_sets_get";
  static const spoonSetEdit =
      baseURL + "/wp-json/bight/spoon_set_edit";
  static const spoonSetCreate =
      baseURL + "/wp-json/bight/spoon_set_create";
  static const spoonSetDelete =
      baseURL + "/wp-json/bight/spoon_Set_delete";

  //Comments
  static const commentGet =
      baseURL + "/wp-json/bight/bight_get_comments";
  static const commentAdd =
      baseURL + "/wp-json/bight/bight_add_comment";
  static const commentDelete =
      baseURL + "/wp-json/bight/bight_delete_comment";

  //Report User
  static const reportUser =
      baseURL + "/wp-json/bight/report_user";

  //JWT Validate
  static const jwtValidate =
      baseURL + "/wp-json/jwt-auth/v1/token/validate";

  //Notifications
  static const notificationGet =
    baseURL + "/wp-json/bight/notification_get";
  static const notificationSeen =
      baseURL + "/wp-json/bight/notification_seen";
}
