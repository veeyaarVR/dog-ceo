part of 'dog_bloc.dart';

abstract class DogEvent extends Equatable {
  const DogEvent();
}

class FetchDogsList extends DogEvent {
  @override
  List<Object?> get props => [];
}

class DogSelected extends DogEvent {
  final String selectedDogName;

  DogSelected({required this.selectedDogName});

  @override
  List<Object?> get props => [selectedDogName];
}
