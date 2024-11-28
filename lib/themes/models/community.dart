class Community {
  bool? success;
  List<Users>? users;

  Community({this.success, this.users});

  Community.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? sId;
  String? userName;
  String? email;
  List<String>? posts;
  List<String>? followers;  // Change from List<Null>? to List<String>?
  List<String>? following;  // Change from List<Null>? to List<String>?
  int? iV;

  Users({
    this.sId,
    this.userName,
    this.email,
    this.posts,
    this.followers,
    this.following,
    this.iV,
  });

  Users.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    email = json['email'];
    posts = List<String>.from(json['posts']);
    if (json['followers'] != null) {
      followers = List<String>.from(json['followers']);  // Convert followers to List<String>
    }
    if (json['following'] != null) {
      following = List<String>.from(json['following']);  // Convert following to List<String>
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userName'] = userName;
    data['email'] = email;
    data['posts'] = posts;
    if (followers != null) {
      data['followers'] = followers;
    }
    if (following != null) {
      data['following'] = following;
    }
    data['__v'] = iV;
    return data;
  }
}
