import 'package:get_it/get_it.dart';
import 'package:grisoftware/core/utils/remote_data_source/data/remote_data_source_impl.dart';
import 'package:grisoftware/core/utils/remote_data_source/domain/remote_data_source.dart';
import 'package:grisoftware/feature/home/data/repo_impl/home_repository_impl.dart';
import 'package:grisoftware/feature/home/domain/repo/home_repository.dart';
import 'package:grisoftware/feature/home/domain/usecase/fetch_short_url_usecase.dart';
import 'package:grisoftware/feature/home/viewmodel/home_page_provider.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton<RemoteDataSourceRepository>(() => RemoteDataSourceImpl());
  serviceLocator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FetchShortUrlUsecase(homeRepository: serviceLocator()));
  serviceLocator.registerLazySingleton<HomePageProvider>(() => HomePageProvider(serviceLocator()));
}
