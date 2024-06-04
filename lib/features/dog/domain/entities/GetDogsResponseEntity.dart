import 'Message.dart';
import 'dart:convert';

GetDogsResponseEntity getDogsResponseEntityFromJson(String str) => GetDogsResponseEntity.fromJson(json.decode(str));
String getDogsResponseEntityToJson(GetDogsResponseEntity data) => json.encode(data.toJson());
class GetDogsResponseEntity {
  GetDogsResponseEntity({
      Message? message, 
      String? status,}){
    _message = message;
    _status = status;
}

  GetDogsResponseEntity.fromJson(dynamic json) {
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
    _status = json['status'];
  }
  Message? _message;
  String? _status;

  Message? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    map['status'] = _status;
    return map;
  }

}