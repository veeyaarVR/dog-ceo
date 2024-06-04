import 'package:dog_ceo/core/resources/dio_client.dart';
import 'package:dog_ceo/features/dog/data/repositories/dog_repository_impl.dart';
import 'package:dog_ceo/features/dog/data/sources/remote/dog_remote_source.dart';
import 'package:dog_ceo/features/dog/domain/repositories/dog_repository.dart';
import 'package:dog_ceo/features/dog/presentation/bloc/dog_bloc.dart';
import 'package:dog_ceo/features/image/data/repositories/image_repository_impl.dart';
import 'package:dog_ceo/features/image/data/sources/remote/image_remote_source.dart';
import 'package:dog_ceo/features/image/domain/repositories/image_repository.dart';
import 'package:dog_ceo/features/image/presentation/bloc/image_bloc.dart';
import 'package:dog_ceo/features/subBreed/data/repositories/sub_breed_repository_impl.dart';
import 'package:dog_ceo/features/subBreed/data/sources/remote/sub_breed_network_source.dart';
import 'package:dog_ceo/features/subBreed/domain/repositories/sub_breed_repository.dart';
import 'package:dog_ceo/features/subBreed/presentation/bloc/sub_breed_bloc.dart';
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

  /*subBreed feature*/
  sl.registerSingleton<SubBreedNetworkSource>(
      SubBreedNetworkSource(dio: sl<DioClient>()));
  sl.registerSingleton<SubBreedRepository>(
      SubBreedRepositoryImpl(networkSource: sl<SubBreedNetworkSource>()));
  sl.registerFactory<SubBreedBloc>(
      () => SubBreedBloc(subBreedRepository: sl<SubBreedRepository>()));

  /*image feature*/
  sl.registerSingleton<ImageRemoteSource>(
      ImageRemoteSource(dio: sl<DioClient>()));
  sl.registerSingleton<ImageRepository>(
      ImageRepositoryImpl(remoteSource: sl<ImageRemoteSource>()));
  sl.registerFactory<ImageBloc>(
      () => ImageBloc(imageRepository: sl<ImageRepository>()));
}
