class allVideos {
  String? id;
  String? title;
  String? thumbnailUrl;
  String? duration;
  String? uploadTime;
  String? views;
  String? author;
  String? videoUrl;
  String? description;
  String? subscriber;
  bool? isLive;

  allVideos(
      {this.id,
      this.title,
      this.thumbnailUrl,
      this.duration,
      this.uploadTime,
      this.views,
      this.author,
      this.videoUrl,
      this.description,
      this.subscriber,
      this.isLive});

  allVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnailUrl = json['thumbnailUrl'];
    duration = json['duration'];
    uploadTime = json['uploadTime'];
    views = json['views'];
    author = json['author'];
    videoUrl = json['videoUrl'];
    description = json['description'];
    subscriber = json['subscriber'];
    isLive = json['isLive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['thumbnailUrl'] = thumbnailUrl;
    data['duration'] = duration;
    data['uploadTime'] = uploadTime;
    data['views'] = views;
    data['author'] = author;
    data['videoUrl'] = videoUrl;
    data['description'] = description;
    data['subscriber'] = subscriber;
    data['isLive'] = isLive;
    return data;
  }
}
