import 'package:dog_ceo/features/dog/data/models/sub_breed_model.dart';

class DogModel {
  final String name;
  final List<SubBreedModel> subBreedsList;

  DogModel({required this.name, required this.subBreedsList});
}
