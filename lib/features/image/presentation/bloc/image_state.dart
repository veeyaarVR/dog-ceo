part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class FetchImageLoading extends ImageState {}

class FetchImageSuccess extends ImageState {
  final String imageURL;

  FetchImageSuccess({required this.imageURL});
}

class FetchImageFailure extends ImageState {
  final String errorMessage;

  FetchImageFailure({required this.errorMessage});
}
