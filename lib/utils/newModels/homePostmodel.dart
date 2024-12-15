// class HomePostmodel {
//   List<Posts>? posts;

//   HomePostmodel({this.posts});

//   HomePostmodel.fromJson(Map<String, dynamic> json) {
//     if (json['posts'] != null) {
//       posts = <Posts>[];
//       json['posts'].forEach((v) {
//         posts!.add( Posts.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (posts != null) {
//       data['posts'] = posts!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Posts {
//   int? id;
//   String? createdBy;
//   String? content;
//   String? media;
//   String? createdAt;
//   String? updatedAt;
//   bool? isPublic;
//   int? likesCount;
//   int? commentsCount;
//   String? tags;
//   String? profilePhoto;

//   Posts(
//       {this.id,
//       this.createdBy,
//       this.content,
//       this.media,
//       this.createdAt,
//       this.updatedAt,
//       this.isPublic,
//       this.likesCount,
//       this.commentsCount,
//       this.tags,
//       this.profilePhoto});

//   Posts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     createdBy = json['created_by'];
//     content = json['content'];
//     media = json['media'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     isPublic = json['is_public'];
//     likesCount = json['likes_count'];
//     commentsCount = json['comments_count'];
//     tags = json['tags'];
//     profilePhoto = json['profile_photo'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['created_by'] = createdBy;
//     data['content'] = content;
//     data['media'] = media;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['is_public'] = isPublic;
//     data['likes_count'] = likesCount;
//     data['comments_count'] = commentsCount;
//     data['tags'] = tags;
//     data['profile_photo'] = profilePhoto;
//     return data;
//   }
// }
