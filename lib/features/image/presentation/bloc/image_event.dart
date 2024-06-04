part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class FetchRandomImage extends ImageEvent {
  final String breedName;

  FetchRandomImage({required this.breedName});
}
