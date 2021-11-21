// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'package:grisoftware/feature/home/domain/entity/url_entity.dart';

class UrlModel extends UrlEntity {
  UrlModel({
    String? shortUrl,
    String? originalUrl,
    required bool ok,
  }) : super(
          shortUrl: shortUrl,
          originalUrl: originalUrl,
          ok: ok,
        );

  factory UrlModel.fromMap(Map<String, dynamic> map) {
    return UrlModel(
      originalUrl: map['result']['original_link'],
      shortUrl: map['result']['short_link'],
      ok: map['ok'],
    );
  }

  factory UrlModel.fromJson(String source) => UrlModel.fromMap(json.decode(source));
}
