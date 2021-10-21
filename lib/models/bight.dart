class Bight {
  int bightID;
  String bightTitle;
  String videoUrl;
  String thumbnailUrl;
  String postedBy;
  int postedById;
  String views;
  String videoLength;
  String description;
  bool isFeatured;
  bool isLiked;
  bool isRemoved;
  bool isFavorite;
  bool currentUsersBight;
  Map<String, dynamic> category;
  String ownerRole;
  String postDate;
  String ownerThumbnail;
  String bightType;
  Bight({
    required this.bightID,
    required this.bightTitle,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.postedBy,
    required this.postedById,
    required this.views,
    required this.videoLength,
    required this.description,
    required this.isFeatured,
    required this.isLiked,
    required this.isRemoved,
    required this.isFavorite,
    required this.category,
    required this.currentUsersBight,
    required this.ownerRole,
    required this.postDate,
    required this.ownerThumbnail,
    required this.bightType,
  });

  factory Bight.fromDatabaseJson(
      {required Map<String, dynamic> bightMap, required Map<String, dynamic> categoryMap, required bool currentUsersBight, String ownerThumbnail = ''}) =>
      Bight(
        bightID: bightMap['ID'],
        bightTitle: bightMap['post_title'],
        postedBy:(bightMap['type'] != 'example') ?
        "${bightMap['owner']['user_firstname']} ${bightMap['owner']['user_lastname']}" : 'Bight Tutorial',
        postedById: bightMap['owner']['ID'],
        thumbnailUrl: bightMap['video_thumbnail']['url'],
        videoUrl: bightMap['video']['url'],
        views: bightMap['views'],
        videoLength: bightMap['video_length'],
        isLiked: bightMap['liked_by_current_user'],
        isRemoved: bightMap['disliked_by_current_user'],
        isFeatured: (bightMap['pinned'] == null) ? false : bightMap['pinned'],
        description: (bightMap['description'] == null) ? '' : bightMap['description'],
        isFavorite: bightMap['favorite_of_current_user'],
        category: categoryMap,
        currentUsersBight: currentUsersBight,
        ownerRole: bightMap['owner_role'],
        postDate: bightMap['post_date'],
        ownerThumbnail: ownerThumbnail,
        bightType: bightMap['type'],
      );
}