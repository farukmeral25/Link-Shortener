import 'dart:convert';

class UrlArgument {
  final String url;

  UrlArgument({required this.url});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory UrlArgument.fromMap(Map<String, dynamic> map) {
    return UrlArgument(
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UrlArgument.fromJson(String source) => UrlArgument.fromMap(json.decode(source));
}
