class NewsModel {
  Sourse? sourse;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;
  bool isLike=false;
  NewsModel.fromJson(Map<String, dynamic> map) {
    sourse = Sourse.fromJson(map['source']);
    author = map['author'];
    title = map['title'];
    description = map['description'];
    url = map['url'];
    urlToImage = map['urlToImage'];
   content = map['content'];
    isLike=false;
  }
}

class Sourse {
  String? id;
  String? name;
  Sourse.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
