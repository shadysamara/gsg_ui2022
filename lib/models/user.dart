class User {
  String? name;
  String? image;
  User.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    image = data['image'];
  }
}
