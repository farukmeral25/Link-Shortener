import 'dart:convert';

import 'package:grisoftware/core/utils/remote_data_source/domain/remote_data_source.dart';
import 'package:grisoftware/feature/home/data/model/url_model.dart';
import 'package:grisoftware/feature/home/domain/entity/argument/url_argument.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSourceRepository {
  static const String domainUrl = "https://api.shrtco.de/v2/shorten?url=";
  @override
  Future<UrlModel> fetchShortUrl(UrlArgument urlArgument) async {
    try {
      final response = await http.get(
        Uri.parse(domainUrl + urlArgument.url),
      );
      Map<String, dynamic> data = jsonDecode(response.body);

      UrlModel urlModel = UrlModel.fromMap(data);
      return urlModel;
    } catch (exp) {
      return UrlModel(ok: false);
    }
  }
}
