import 'package:dog_ceo/features/dog/presentation/bloc/dog_bloc.dart';
import 'package:dog_ceo/features/dog/presentation/widgets/dogs_list_widget.dart';
import 'package:dog_ceo/features/subBreed/presentation/widgets/sub_breed_bottom_sheet.dart';
import 'package:dog_ceo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogHomeScreen extends StatefulWidget {
  const DogHomeScreen({super.key});

  @override
  State<DogHomeScreen> createState() => _DogHomeScreenState();
}

class _DogHomeScreenState extends State<DogHomeScreen> {
  Map<String, List<String>> dataList = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => sl<DogBloc>()..add(FetchDogsList()),
          child: BlocListener<DogBloc, DogState>(
            listener: (context, state) {
              debugPrint("Dog Bloc state is $state");
              if (state is FetchDogsSuccess) {
                setState(() {
                  dataList = state.dogsGroupedByName;
                });
              }
              if (state is ShowBreedBottomSheet) {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: false,
                  builder: (BuildContext context) {
                    return SubBreedBottomSheet(dogName: state.dogName);
                  },
                );
              }
            },
            child: BlocBuilder<DogBloc, DogState>(
              builder: (context, state) {
                switch (state) {
                  case FetchDogsLoading():
                    return _progressLoader();
                  case FetchDogsFailed():
                    return _failureMessage(state.errorMessage);
                  case FetchDogsSuccess():
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 35.0, left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dogs CEO",
                              style: Theme.of(context).textTheme.headlineLarge),
                          Text(
                            "Collection of open source dog pictures.",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: DogsListWidget(
                            dataList: dataList,
                            onDogClicked: (selectedDogName) {
                              BlocProvider.of<DogBloc>(context).add(DogSelected(
                                  selectedDogName: selectedDogName));
                            },
                          )),
                        ],
                      ),
                    );
                  default:
                    return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _progressLoader() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('fetching dogs'),
        )
      ],
    ));
  }

  Widget _failureMessage(String message) {
    return Center(child: Text(message));
  }
}
