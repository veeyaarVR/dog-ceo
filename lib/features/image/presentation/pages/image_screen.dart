import 'package:dog_ceo/features/image/presentation/bloc/image_bloc.dart';
import 'package:dog_ceo/features/image/presentation/widgets/image_container.dart';
import 'package:dog_ceo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageScreen extends StatefulWidget {
  final String breedName;
  final String subBreedName;

  const ImageScreen(this.breedName, this.subBreedName, {super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
          child: Column(
            children: [
              _customAppBar(),
              BlocProvider(
                create: (context) => sl<ImageBloc>()
                  ..add(FetchRandomImage(breedName: widget.breedName)),
                child: BlocBuilder<ImageBloc, ImageState>(
                  builder: (context, state) {
                    switch (state) {
                      case FetchImageSuccess():
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ImageContainer(imageURL: state.imageURL),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, top: 16.0),
                                  child: Flexible(
                                    child: Text(
                                      widget.breedName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Flexible(
                                    child: Text(
                                      widget.subBreedName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      case FetchImageFailure():
                        return _failureMessage(state.errorMessage);
                      case FetchImageLoading():
                        return _progressLoader();
                      default:
                        return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            "Breed Details",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        )
      ],
    );
  }

  Widget _progressLoader() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('fetching image'),
            )
          ],
        ),
      ),
    );
  }

  Widget _failureMessage(String message) {
    return Center(child: Text(message));
  }
}
