import 'package:dog_ceo/features/image/presentation/bloc/image_bloc.dart';
import 'package:dog_ceo/features/image/presentation/widgets/image_container.dart';
import 'package:dog_ceo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageScreen extends StatefulWidget {
  final String breedName;

  const ImageScreen(this.breedName, {super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 10,
            title: Text("Random Image"),
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: const Icon(
                  Icons.arrow_back,
                  size: 28,
                ),
              ),
            )),
        body: BlocProvider(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.breedName.toUpperCase(),
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          ImageContainer(imageURL: state.imageURL)
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
          child: Text('fetching image'),
        )
      ],
    ));
  }

  Widget _failureMessage(String message) {
    return Center(child: Text(message));
  }
}
