import 'package:dog_ceo/features/subBreed/presentation/bloc/sub_breed_bloc.dart';
import 'package:dog_ceo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_breed_item.dart';

class SubBreedBottomSheet extends StatefulWidget {
  final String dogName;

  const SubBreedBottomSheet({super.key, required this.dogName});

  @override
  State<SubBreedBottomSheet> createState() => _SubBreedBottomSheetState();
}

class _SubBreedBottomSheetState extends State<SubBreedBottomSheet> {
  @override
  Widget build(BuildContext context) {
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
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          "Sub Breeds",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: subBreedList.length,
                          itemBuilder: (context, index) {
                            return SubBreedItem(
                              subBreedName: subBreedList[index],
                              breedName: widget.dogName
                            );
                          }),
                    ],
                  ),
                );
            }
            return SizedBox(height: 200, child: Container());
          },
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
}
