import 'attachment.dart';

class CarData {
  int carId;
  String rcNumber;
  int capacity;
  String model;
  String remark;
  int isActive;
  int createdBy;
  List<Attachment> attachments;

  CarData({
    required this.carId,
    required this.rcNumber,
    required this.capacity,
    required this.model,
    required this.remark,
    required this.isActive,
    required this.createdBy,
    required this.attachments,
  });

  factory CarData.fromJson(Map<String, dynamic> json) => CarData(
    carId: json["car_id"],
    rcNumber: json["rc_number"],
    capacity: json["capacity"],
    model: json["model"],
    remark: json["remark"],
    isActive: json["is_active"],
    createdBy: json["created_by"],
    attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "car_id": carId,
    "rc_number": rcNumber,
    "capacity": capacity,
    "model": model,
    "remark": remark,
    "is_active": isActive,
    "created_by": createdBy,
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
  };
}