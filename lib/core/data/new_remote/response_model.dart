import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  String message;
  List<dynamic> list;
  dynamic content;
  bool success;

  ResponseModel({
    required this.message,
    required this.list,
    required this.content,
    required this.success,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        message: json["message"],
        list: json["list"] == null
            ? []
            : List<dynamic>.from(json["list"].map((x) => x)),
        content: json["content"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "list": List<dynamic>.from(list.map((x) => x)),
        "content": content,
        "success": success,
      };
}
