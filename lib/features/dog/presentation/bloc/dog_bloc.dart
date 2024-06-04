import 'package:bloc/bloc.dart';
import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/features/dog/domain/repositories/dog_repository.dart';
import 'package:equatable/equatable.dart';

part 'dog_event.dart';

part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final DogRepository dogRepository;

  DogBloc({required this.dogRepository}) : super(DogInitial()) {
    on<FetchDogsList>((event, emit) async {
      emit(FetchDogsLoading());
      var dogsListDataState = await dogRepository.getDogsGroupedByName();

      // emit events based on DataState type
      if (dogsListDataState is DataFailed) {
        emit(FetchDogsFailed(
            errorMessage:
                dogsListDataState.errorMessage ?? "Something went wrong"));
      } else {
        emit(FetchDogsSuccess(dogsGroupedByName: dogsListDataState.data ?? {}));
      }
    });

    on<DogSelected>((event, emit) {
      emit(ShowBreedBottomSheet(dogName: event.selectedDogName));
    });
  }
}
