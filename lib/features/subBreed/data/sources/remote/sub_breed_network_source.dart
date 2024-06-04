import 'package:dog_ceo/core/constants/remote_constants.dart';
import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/core/resources/dio_client.dart';

class SubBreedNetworkSource {
  final DioClient dio;

  SubBreedNetworkSource({required this.dio});

  /// https://dog.ceo/api/[dogName]/hound/list
  Future<DataState<List<String>>> getSubBreedList(String dogName) async {
    try {
      Map<String, dynamic> response =
          await dio.get("$getSubBreed/$dogName/list");

      if (dio.isApiSuccess(response)) {
        /// if success, get data from message object
        List<dynamic> dataList =
            response["message"]; // expect empty or array of dynamic
        List<String> subBreedList = [];

        // convert to string and add data to list
        for (var element in dataList) {
          subBreedList.add(element.toString());
        }

        // validate list and update DataState
        if (subBreedList.isNotEmpty) {
          return DataSuccess(subBreedList);
        } else {
          return DataFailed(errorMessage: "No Sub-breeds found");
        }
      } else {
        return DataFailed(errorMessage: "Couldn't fetch sub breeds now.");
      }
    } on TypeError {
      return DataFailed(errorMessage: "No Sub-breeds found");
    } catch (e) {
      return DataFailed(errorMessage: e.toString());
    }
  }
}
