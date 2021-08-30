class Maxim {
  String? author;
  String? message;

  Maxim({this.author, this.message});

  Maxim.fromJson(dynamic json) {
    author = json['author'];
    message = json['message'];
  }
}
