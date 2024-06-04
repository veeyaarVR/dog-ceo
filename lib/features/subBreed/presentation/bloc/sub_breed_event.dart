part of 'sub_breed_bloc.dart';

@immutable
abstract class SubBreedEvent {}

class FetchSubBreed extends SubBreedEvent {
  final String dogName;

  FetchSubBreed({required this.dogName});
}

class SubBreedSelected extends SubBreedEvent {}
