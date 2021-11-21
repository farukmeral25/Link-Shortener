// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:grisoftware/core/utils/remote_data_source/domain/remote_data_source.dart';
import 'package:grisoftware/feature/home/data/model/url_model.dart';
import 'package:grisoftware/feature/home/domain/entity/argument/url_argument.dart';
import 'package:grisoftware/feature/home/domain/entity/url_entity.dart';
import 'package:grisoftware/feature/home/domain/repo/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  RemoteDataSourceRepository repository;
  HomeRepositoryImpl({
    required this.repository,
  });

  @override
  Future<UrlEntity> fetchShortUrl(UrlArgument urlArgument) async {
    return await repository.fetchShortUrl(urlArgument);
  }
}
