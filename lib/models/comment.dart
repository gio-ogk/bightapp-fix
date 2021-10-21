class Comment {
  int id;
  int userId;
  String userFullName;
  String? userType;
  String postDate;
  String commentText;

  Comment({
    required this.id,
    required this.userId,
    required this.userFullName,
    this.userType,
    required this.postDate,
    required this.commentText,
  });

  factory Comment.fromDatabaseJson(Map<String, dynamic> commentMap) => Comment(
    id: int.parse(commentMap['comment_ID']),
    userId: int.parse(commentMap['user_id']),
    userFullName: commentMap['comment_author'],
    postDate: commentMap['comment_date_gmt'],
    commentText: commentMap['comment_content'],
  );
}