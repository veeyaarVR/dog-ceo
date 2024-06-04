import 'package:dog_ceo/core/resources/dio_client.dart';
import 'package:dog_ceo/features/dog/data/data_sources/remote/dog_remote_source.dart';
import 'package:dog_ceo/features/dog/data/repositories/dog_repository_impl.dart';
import 'package:dog_ceo/features/dog/domain/repositories/dog_repository.dart';
import 'package:dog_ceo/features/dog/presentation/bloc/dog_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  /*dio client - wrapper for [Dio]*/
  sl.registerSingleton<DioClient>(DioClient.instance);

  /*dog feature*/
  sl.registerSingleton<DogRemoteSource>(DogRemoteSource(sl<DioClient>()));
  sl.registerSingleton<DogRepository>(
      DogRepositoryImpl(remoteSource: sl<DogRemoteSource>()));
  sl.registerFactory<DogBloc>(
      () => DogBloc(dogRepository: sl<DogRepository>()));
}
