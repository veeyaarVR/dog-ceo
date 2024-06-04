import 'package:bloc/bloc.dart';
import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/features/image/domain/repositories/image_repository.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository imageRepository;

  ImageBloc({required this.imageRepository}) : super(ImageInitial()) {
    on<FetchRandomImage>((event, emit) async {
      emit(FetchImageLoading());
      var fetchImageDataState =
          await imageRepository.getRandomDogImage(event.breedName);
      if (fetchImageDataState is DataSuccess) {
        emit(FetchImageSuccess(imageURL: fetchImageDataState.data ?? ""));
      } else {
        emit(FetchImageFailure(
            errorMessage:
                fetchImageDataState.errorMessage ?? "Something went wrong"));
      }
    });
  }
}
