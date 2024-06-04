part of 'dog_bloc.dart';

abstract class DogEvent extends Equatable {
  const DogEvent();
}

/// to trigger the api call to fetch dog list
class FetchDogsList extends DogEvent {
  @override
  List<Object?> get props => [];
}


