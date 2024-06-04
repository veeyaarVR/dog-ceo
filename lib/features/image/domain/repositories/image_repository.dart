import 'package:dog_ceo/core/resources/data_state.dart';

abstract class ImageRepository {
  Future<DataState<String>> getRandomDogImage(String breedName);
}
