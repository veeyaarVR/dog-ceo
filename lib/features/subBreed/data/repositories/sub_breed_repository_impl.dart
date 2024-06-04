import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/features/subBreed/data/sources/remote/sub_breed_network_source.dart';
import 'package:dog_ceo/features/subBreed/domain/repositories/sub_breed_repository.dart';

class SubBreedRepositoryImpl extends SubBreedRepository {
  final SubBreedNetworkSource networkSource;

  SubBreedRepositoryImpl({required this.networkSource});

  @override
  Future<DataState<List<String>>> getSubBreedList(String dogName) async {
    return await networkSource.getSubBreedList(dogName);
  }
}
