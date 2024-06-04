part of 'dog_bloc.dart';

abstract class DogEvent extends Equatable {
  const DogEvent();
}

class FetchDogsList extends DogEvent {
  @override
  List<Object?> get props => [];
}


