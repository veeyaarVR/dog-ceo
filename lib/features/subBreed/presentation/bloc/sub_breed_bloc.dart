import 'package:bloc/bloc.dart';
import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/features/subBreed/domain/repositories/sub_breed_repository.dart';
import 'package:meta/meta.dart';

part 'sub_breed_event.dart';

part 'sub_breed_state.dart';

class SubBreedBloc extends Bloc<SubBreedEvent, SubBreedState> {
  final SubBreedRepository subBreedRepository;

  SubBreedBloc({required this.subBreedRepository}) : super(SubBreedInitial()) {
    on<FetchSubBreed>((event, emit) async {
      emit(FetchSubBreedLoading());
      var subBreedDataState =
          await subBreedRepository.getSubBreedList(event.dogName);
      if (subBreedDataState is DataSuccess) {
        emit(FetchSubBreedSuccess(subBreedList: subBreedDataState.data ?? []));
      } else {
        emit(FetchSubBreedFailure(
            errorMessage:
                subBreedDataState.errorMessage ?? "Something went wrong"));
      }
    });
  }
}
