import 'package:dog_ceo/core/resources/data_state.dart';

abstract class DogRepository {
  Future<DataState<Map<String, List<String>>>> getDogsGroupedByName();
}
