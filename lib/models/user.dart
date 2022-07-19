class User {
  String? name;
  String? image;
  User(this.name, this.image);
  User.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    image = data['image'];
  }
}
