class UrlEntity {
  final String? shortUrl;
  final String? originalUrl;
  final bool ok;
  bool copy;
  UrlEntity({
    required this.ok,
    this.shortUrl,
    this.originalUrl,
    this.copy = false,
  });
}
