import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/features/image/data/sources/remote/image_remote_source.dart';
import 'package:dog_ceo/features/image/domain/repositories/image_repository.dart';

class ImageRepositoryImpl extends ImageRepository {
  final ImageRemoteSource remoteSource;

  ImageRepositoryImpl({required this.remoteSource});

  @override
  Future<DataState<String>> getRandomDogImage(String breedName) async {
    return await remoteSource.getRandomImage(breedName);
  }
}
