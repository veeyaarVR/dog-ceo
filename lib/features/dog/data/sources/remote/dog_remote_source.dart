import 'package:dog_ceo/core/constants/remote_constants.dart';
import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/core/resources/dio_client.dart';
import 'package:dog_ceo/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class DogRemoteSource {
  final DioClient dio;

  DogRemoteSource(this.dio);

  Future<DataState<Map<String, List<String>>>> getAllDogsList() async {
    try {
      Map<String, dynamic> response = await dio.get(getAllDogs);

      if (dio.isApiSuccess(response)) {
        // if success, get all the keys from message object
        Map<String, dynamic> message = response["message"];
        Iterable<String> dogKeysList =
            message.keys; // fetching keys because they hold the name of dogs

        if (dogKeysList.isEmpty) {
          return DataFailed(errorMessage: "No dogs found");
        }

        Map<String, List<String>> dogsMap = {};
        for (var dogName in dogKeysList) {
          // create a hashmap and add keys as first letter of the name,
          // and value as list of dog names that starts with the key value
          String firstLetter = dogName[0];
          List<String> dogsList = dogsMap[firstLetter] ?? [];
          dogsList.add(dogName.capitalize());
          dogsMap[firstLetter] = dogsList;
        }
        debugPrint(dogsMap.toString());
        return DataSuccess(dogsMap);
      } else {
        return DataFailed(errorMessage: "Couldn't fetch dogs now.");
      }
    } catch (e) {
      return DataFailed(errorMessage: e.toString());
    }
  }
}
