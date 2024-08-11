class PhotoModel {
  String imgSrc;
  String photographerName;

  PhotoModel({
    required this.imgSrc,
    required this.photographerName,
  });

  static fromAPI2App(Map<String, dynamic> photoMap) {
    return PhotoModel(
      imgSrc: (photoMap['src'])['portrait'],
      photographerName: photoMap['photographer'],
    );
  }
}
