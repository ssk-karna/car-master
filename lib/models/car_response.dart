
import 'car_data.dart';

class CarResponse {
  bool success;
  String message;
  List<CarData> data;

  CarResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CarResponse.fromJson(Map<String, dynamic> json) => CarResponse(
    success: json["success"],
    message: json["message"],
    data: List<CarData>.from(json["data"].map((x) => CarData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
