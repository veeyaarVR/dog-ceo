import 'package:dog_ceo/core/resources/data_state.dart';

abstract class SubBreedRepository {
  Future<DataState<List<String>>> getSubBreedList(String dogName);
}
