class Post {
  Post({
    this.id,
    this.title,
    this.body,
  });

  num id;
  String title;
  String body;

  factory Post.fromJson(Map<dynamic, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
      };
}
