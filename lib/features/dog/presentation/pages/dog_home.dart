import 'dart:math';

import 'package:dog_ceo/core/resources/data_state.dart';
import 'package:dog_ceo/core/resources/dio_client.dart';
import 'package:dog_ceo/features/dog/data/data_sources/remote/dog_remote_source.dart';
import 'package:flutter/material.dart';

class DogHomeScreen extends StatefulWidget {
  const DogHomeScreen({super.key});

  @override
  State<DogHomeScreen> createState() => _DogHomeScreenState();
}

class _DogHomeScreenState extends State<DogHomeScreen> {
  Map<String, List<String>> dataList = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doEpicShit();
  }

  Future<void> doEpicShit() async {
    var dio = DioClient.instance;
    var remoteSource = DogRemoteSource(dio);
    DataState<Map<String, List<String>>> getDogsDataState =
        await remoteSource.getAllDogsList();
    if (getDogsDataState is DataSuccess) {
      setState(() {
        dataList = getDogsDataState.data ?? {};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dogs CEO",
                  style: Theme.of(context).textTheme.headlineLarge),
              Text(
                "Collection of open source dog pictures.",
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataList.keys.length,
                    itemBuilder: (context, index) {
                      String keyString = dataList.keys.toList()[index];
                      List<String> dogNames = dataList[keyString] ?? [];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              child: Text(
                                dataList.keys.toList()[index],
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 8,
                                            crossAxisCount: 2),
                                    itemCount: dogNames.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          decoration: BoxDecoration(
                                              color: Colors.accents[Random()
                                                  .nextInt(
                                                      Colors.accents.length)],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                    dogNames[index])),
                                          ));
                                    }))
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
