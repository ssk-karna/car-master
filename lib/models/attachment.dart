import 'attachment_url.dart';

class Attachment {
  AttachmentType attachmentType;
  List<AttachmentUrl> attachmentUrl;

  Attachment({
    required this.attachmentType,
    required this.attachmentUrl,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    attachmentType: attachmentTypeValues.map[json["attachment_type"]]!,
    attachmentUrl: List<AttachmentUrl>.from(json["attachment_url"].map((x) => AttachmentUrl.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "attachment_type": attachmentTypeValues.reverse[attachmentType],
    "attachment_url": List<dynamic>.from(attachmentUrl.map((x) => x.toJson())),
  };
}

enum AttachmentType {
  CAR_INSURANCE,
  CAR_PHOTO,
  CAR_RC
}

final attachmentTypeValues = EnumValues({
  "Car_Insurance": AttachmentType.CAR_INSURANCE,
  "Car_Photo": AttachmentType.CAR_PHOTO,
  "Car_RC": AttachmentType.CAR_RC
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}