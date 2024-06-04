import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageURL;

  const ImageContainer({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Image.network(fit: BoxFit.fitWidth, imageURL, loadingBuilder:
            (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
          if (loadingProgress?.cumulativeBytesLoaded.toString() ==
              loadingProgress?.expectedTotalBytes.toString()) {
            return child;
          } else {
            return SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }),
      ),
    );
  }
}
