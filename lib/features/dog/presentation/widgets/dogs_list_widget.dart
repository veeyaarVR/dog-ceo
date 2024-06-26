import 'package:dog_ceo/features/dog/presentation/widgets/dog_card_widget.dart';
import 'package:dog_ceo/features/dog/presentation/widgets/first_letter_widget.dart';
import 'package:flutter/material.dart';

class DogsListWidget extends StatelessWidget {
  final Map<String, List<String>> dataList;

  /// renders listview with inner list of dog names as gridView
  const DogsListWidget({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    // list view renders alphabets and inner collection of another list
    // rendered as grid view
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: dataList.keys.length,
        itemBuilder: (context, index) {
          String keyString = dataList.keys
              .toList()[index]; // keyStrings contains first letter of name
          List<String> dogNames = dataList[keyString] ??
              []; // dogNames contains list of dogs that starts with [keyString]
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FirstLetterWidget(text: dataList.keys.toList()[index]),
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
                            return DogCardWidget(dogName: dogNames[index]);
                          }))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              )
            ],
          );
        });
  }
}
