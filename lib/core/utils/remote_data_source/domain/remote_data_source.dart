// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:grisoftware/feature/home/data/model/url_model.dart';
import 'package:grisoftware/feature/home/domain/entity/argument/url_argument.dart';

abstract class RemoteDataSourceRepository {
  Future<UrlModel> fetchShortUrl(UrlArgument urlArgument);
}
