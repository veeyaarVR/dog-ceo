import 'package:dog_ceo/core/constants/constants.dart';
import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/core/resources/dio_client.dart';
import 'package:flutter/cupertino.dart';

class SubBreedNetworkSource {
  final DioClient dio;

  SubBreedNetworkSource({required this.dio});

  Future<DataState<List<String>>> getSubBreedList(String dogName) async {
    try {
      Map<String, dynamic> response =
          await dio.get("$getSubBreed/$dogName/list");

      if (dio.isApiSuccess(response)) {
        /// if success, get data from message object

        try {
          List<dynamic> subBreedList = response["message"];
          List<String> dataList = [];
          for (var element in subBreedList) {
            dataList.add(element.toString());
          }
          if (dataList.isNotEmpty) {
            return DataSuccess(dataList);
          } else {
            return DataFailed(errorMessage: "No Sub-breeds found");
          }
        } on TypeError {
          return DataFailed(errorMessage: "No Sub-breeds found");
        } catch (e) {
          debugPrint("${e.runtimeType}  ${e.toString()}");
          return DataFailed(errorMessage: "No Sub-breeds found");
        }
      } else {
        return DataFailed(errorMessage: "Couldn't fetch sub breeds now.");
      }
    } catch (e) {
      return DataFailed(errorMessage: e.toString());
    }
  }
}
