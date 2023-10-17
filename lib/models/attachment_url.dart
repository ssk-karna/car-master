class AttachmentUrl {
  int id;
  String url;

  AttachmentUrl({
    required this.id,
    required this.url,
  });

  factory AttachmentUrl.fromJson(Map<String, dynamic> json) => AttachmentUrl(
    id: json["id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
  };
}