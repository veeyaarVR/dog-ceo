import 'package:dog_ceo/core/constants/remote_constants.dart';
import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/core/resources/dio_client.dart';

class ImageRemoteSource {
  final DioClient dio;

  ImageRemoteSource({required this.dio});

  Future<DataState<String>> getRandomImage(String breedName) async {
    try {
      Map<String, dynamic> response =
          await dio.get("$getImagePrefix${breedName.toLowerCase()}$getImageSuffix");

      if (dio.isApiSuccess(response)) {
        /// if success, get data from message object
        String imageURL = response["message"];
        if (imageURL.isNotEmpty) {
          return DataSuccess(imageURL);
        } else {
          return DataFailed(errorMessage: "Fetching image failed");
        }
      } else {
        return DataFailed(errorMessage: "Couldn't fetch images now.");
      }
    } catch (e) {
      return DataFailed(errorMessage: e.toString());
    }
  }
}
