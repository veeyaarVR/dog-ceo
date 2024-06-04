part of 'dog_bloc.dart';

abstract class DogState extends Equatable {
  const DogState();
}

class DogInitial extends DogState {
  @override
  List<Object> get props => [];
}

class FetchDogsLoading extends DogState {
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

class ShowBreedBottomSheet extends DogState {
  final String dogName;

  ShowBreedBottomSheet({required this.dogName});

  @override
  List<Object?> get props => [dogName];
}
