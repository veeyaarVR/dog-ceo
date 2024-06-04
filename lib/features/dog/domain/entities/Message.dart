import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {

  Message.fromJson(dynamic json) {
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    return map;
  }

}