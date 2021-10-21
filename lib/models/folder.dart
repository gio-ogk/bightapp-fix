class FavoritesFolder{
  final String name;
  final int folderId;
  final List<dynamic> bightIds;
  final String folderImg;

  FavoritesFolder({
    required this.name,
    required this.folderId,
    required this.bightIds,
    required this.folderImg,
  });

  factory FavoritesFolder.fromDatabaseJson(Map<String, dynamic> folderMap) => FavoritesFolder(
    name: folderMap['post_title'],
    folderId: folderMap['ID'],
    bightIds: folderMap['video_ids'],
    folderImg: (folderMap['image']?.isEmpty ?? true) ? null : folderMap['image']['url'],
  );
}