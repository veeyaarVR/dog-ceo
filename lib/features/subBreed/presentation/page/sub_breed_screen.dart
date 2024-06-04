import 'package:dog_ceo/features/subBreed/presentation/bloc/sub_breed_bloc.dart';
import 'package:dog_ceo/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/sub_breed_item.dart';

class SubBreedScreen extends StatefulWidget {
  final String dogName;

  /// Renders Sub Breed screen based on [dogName]
  const SubBreedScreen({super.key, required this.dogName});

  @override
  State<SubBreedScreen> createState() => _SubBreedScreenState();
}

class _SubBreedScreenState extends State<SubBreedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
          child: Column(
            children: [_customAppBar(), Expanded(child: _subBreedsGenerator())],
          ),
        ),
      ),
    );
  }

  Widget _progressLoader() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _failureMessageWidget(String errorMessage) {
    return SizedBox(
      height: 200,
      child: Center(child: Text(errorMessage)),
    );
  }

  Widget _customAppBar() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "${widget.dogName} - Sub Breeds",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        )
      ],
    );
  }

  Widget _subBreedsGenerator() {
    return BlocProvider(
      create: (context) =>
          sl<SubBreedBloc>()..add(FetchSubBreed(dogName: widget.dogName)),
      child: BlocListener<SubBreedBloc, SubBreedState>(
        listener: (context, state) {
          debugPrint("sub breed state is $state");
        },
        child: BlocBuilder<SubBreedBloc, SubBreedState>(
          builder: (context, state) {
            switch (state) {
              case FetchSubBreedFailure():
                return _failureMessageWidget(state.errorMessage);
              case FetchSubBreedLoading():
                return _progressLoader();
              case FetchSubBreedSuccess():
                var subBreedList = state.subBreedList;
                return _subBreedListWidget(subBreedList);
            }
            return SizedBox(height: 200, child: Container());
          },
        ),
      ),
    );
  }

  Widget _subBreedListWidget(List<String> subBreedList) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: subBreedList.length,
          itemBuilder: (context, index) {
            return SubBreedItem(
                subBreedName: subBreedList[index], breedName: widget.dogName);
          }),
    );
  }
}
