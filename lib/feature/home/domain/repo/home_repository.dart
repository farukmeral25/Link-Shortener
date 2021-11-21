import 'package:grisoftware/feature/home/domain/entity/argument/url_argument.dart';
import 'package:grisoftware/feature/home/domain/entity/url_entity.dart';

abstract class HomeRepository {
  Future<UrlEntity> fetchShortUrl(UrlArgument urlArgument);
}
