class FollowersList {
  int? id;
  String? username;

  FollowersList({this.id, this.username});

  FollowersList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    return data;
  }
}
