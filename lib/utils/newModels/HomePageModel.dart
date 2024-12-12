class HomePage {
  List<LeftBar>? leftBar;
  List<Posts>? posts;
  List<RightBar>? rightBar;

  HomePage({this.leftBar, this.posts, this.rightBar});

  HomePage.fromJson(Map<String, dynamic> json) {
    if (json['left_bar'] != null) {
      leftBar = <LeftBar>[];
      json['left_bar'].forEach((v) {
        leftBar!.add(LeftBar.fromJson(v));
      });
    }
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add( Posts.fromJson(v));
      });
    }
    if (json['right_bar'] != null) {
      rightBar = <RightBar>[];
      json['right_bar'].forEach((v) {
        rightBar!.add( RightBar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (leftBar != null) {
      data['left_bar'] = leftBar!.map((v) => v.toJson()).toList();
    }
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    if (rightBar != null) {
      data['right_bar'] = rightBar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeftBar {
  String? name;
  String? url;

  LeftBar({this.name, this.url});

  LeftBar.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Posts {
  int? id;
  int? createdBy;
  String? content;
  String? media;
  String? createdAt;
  String? updatedAt;
  bool? isPublic;
  int? likesCount;
  int? commentsCount;
  String? tags;

  Posts(
      {this.id,
      this.createdBy,
      this.content,
      this.media,
      this.createdAt,
      this.updatedAt,
      this.isPublic,
      this.likesCount,
      this.commentsCount,
      this.tags});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    content = json['content'];
    media = json['media'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isPublic = json['is_public'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['created_by'] = createdBy;
    data['content'] = content;
    data['media'] = media;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_public'] = isPublic;
    data['likes_count'] = likesCount;
    data['comments_count'] = commentsCount;
    data['tags'] = tags;
    return data;
  }
}

class RightBar {
  int? id;
  String? username;
  String? fullName;
  String? bio;

  RightBar({this.id, this.username, this.fullName, this.bio});

  RightBar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['full_name'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['full_name'] = fullName;
    data['bio'] = bio;
    return data;
  }
}
