import 'package:gsk_ui/models/post.dart';
import 'package:gsk_ui/models/user.dart';

class PostResponse {
  User? user;
  Post? post;
  PostResponse.fromJson(Map<String, dynamic> data) {
    user = User.fromJson(data['user']);
    post = Post.fromJson(data['post']);
  }
}
