import 'package:yoyo/domain/entity/streamlink_entity.dart';

class StreamLinkModel extends StreamLinkEntity {
  StreamLinkModel({
    required super.headers,
    required super.sources,
    required super.download,
  });
  factory StreamLinkModel.fromMap(Map<String, dynamic> json) => StreamLinkModel(
        headers: HeadersModel.fromMap(json["headers"]),
        sources: List<SourceModel>.from(
            json["sources"].map((x) => SourceModel.fromMap(x))),
        download: json["download"],
      );
}

class HeadersModel extends HeadersEntity {
  HeadersModel({required super.referer});
  factory HeadersModel.fromMap(Map<String, dynamic> json) => HeadersModel(
        referer: json["Referer"],
      );
}

class SourceModel extends SourceEntity {
  SourceModel(
      {required super.url, required super.isM3U8, required super.quality});
  factory SourceModel.fromMap(Map<String, dynamic> json) => SourceModel(
        url: json["url"],
        isM3U8: json["isM3U8"],
        quality: json["quality"],
      );
}
