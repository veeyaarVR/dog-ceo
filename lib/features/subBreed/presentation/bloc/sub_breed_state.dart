part of 'sub_breed_bloc.dart';

@immutable
abstract class SubBreedState {}

class SubBreedInitial extends SubBreedState {}

class FetchSubBreedLoading extends SubBreedState {}

class FetchSubBreedSuccess extends SubBreedState {
  final List<String> subBreedList;

  FetchSubBreedSuccess({required this.subBreedList});

}

class FetchSubBreedFailure extends SubBreedState {
  final String errorMessage;

  FetchSubBreedFailure({required this.errorMessage});
}
