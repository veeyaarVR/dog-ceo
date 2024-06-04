import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/features/dog/data/sources/remote/dog_remote_source.dart';
import 'package:dog_ceo/features/dog/domain/repositories/dog_repository.dart';

class DogRepositoryImpl extends DogRepository {
  final DogRemoteSource remoteSource;

  DogRepositoryImpl({required this.remoteSource});

  @override
  Future<DataState<Map<String, List<String>>>> getDogsGroupedByName() async {
    return await remoteSource.getAllDogsList();
  }
}
