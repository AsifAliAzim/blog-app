class User {
  String id;
  final String blogTitle;
  final String blogDescription;
  final String blogHeaderImage;
  DateTime date;

  User({
    this.id = '',
    required this.blogTitle,
    required this.blogDescription,
    required this.blogHeaderImage,
    required this.date,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        blogTitle: json['blogTitle'],
        blogDescription: json['blogText'],
        date: json['date'],
        blogHeaderImage: json['imageUrl'],
      );
}
