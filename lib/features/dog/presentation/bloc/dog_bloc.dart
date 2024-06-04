import 'package:bloc/bloc.dart';
import 'package:dog_ceo/features/dog/domain/repositories/dog_repository.dart';
import 'package:equatable/equatable.dart';

part 'dog_event.dart';

part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final DogRepository dogRepository;

  DogBloc({required this.dogRepository}) : super(DogInitial()) {
    on<DogEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
