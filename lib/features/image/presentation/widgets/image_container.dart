import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageContainer extends StatelessWidget {
  final String imageURL;

  const ImageContainer({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          _placeHolderColor(),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.cover,
              placeholder: kTransparentImage,
              image: imageURL,
              height: 400,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  /// shows a basic color until the image fades in and loads
  Widget _placeHolderColor() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 400,
        width: double.infinity,
        color: Colors.blueGrey[100],
      ),
    );
  }
}
