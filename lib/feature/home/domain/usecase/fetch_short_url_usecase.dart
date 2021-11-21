import 'package:grisoftware/core/usecase/usecase.dart';
import 'package:grisoftware/feature/home/domain/entity/argument/url_argument.dart';
import 'package:grisoftware/feature/home/domain/entity/url_entity.dart';
import 'package:grisoftware/feature/home/domain/repo/home_repository.dart';

class FetchShortUrlUsecase implements Usecase<UrlEntity, UrlArgument> {
  HomeRepository homeRepository;
  FetchShortUrlUsecase({
    required this.homeRepository,
  });
  @override
  Future<UrlEntity> call(UrlArgument urlArgument) async {
    return await homeRepository.fetchShortUrl(urlArgument);
  }
}
