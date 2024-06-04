part of 'dog_bloc.dart';

abstract class DogState extends Equatable {
  const DogState();
}

class DogInitial extends DogState {
  @override
  List<Object> get props => [];
}

class NoNetworkState extends DogState {
  @override
  List<Object?> get props => [];
}

class FetchDogsFailed extends DogState {
  final String errorMessage;

  FetchDogsFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class FetchDogsSuccess extends DogState {
  final Map<String, List<String>> dogsGroupedByName;

  FetchDogsSuccess({required this.dogsGroupedByName});

  @override
  List<Object?> get props => [];
}
