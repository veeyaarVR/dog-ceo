import 'package:dog_ceo/core/constants/constants.dart';
import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/core/resources/dio_client.dart';
import 'package:flutter/material.dart';

class DogRemoteSource {
  final DioClient dio;

  DogRemoteSource(this.dio);

  Future<DataState<Map<String, List<String>>>> getAllDogsList() async {
    try {
      Map<String, dynamic> response = await dio.get(getAllDogs);

      // if status == success , consider api is successful
      String status = response["status"];
      if (status == "success") {
        /// if success, get all the keys from message object
        Map<String, dynamic> message = response["message"];
        Iterable<String> dogKeysList = message.keys;

        Map<String, List<String>> dogsMap = {};
        for (var dogName in dogKeysList) {
          String firstLetter = dogName[0];
          List<String> dogsList = dogsMap[firstLetter] ?? [];
          dogsList.add(dogName);
          dogsMap[firstLetter] = dogsList;
        }
        debugPrint(dogsMap.toString());
        return DataSuccess(dogsMap);
      } else {
        return DataFailed(errorMessage: "No dogs found");
      }
    } catch (e) {
      return DataFailed(errorMessage: e.toString());
    }
  }
}
