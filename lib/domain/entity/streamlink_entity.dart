class StreamLinkEntity {
  StreamLinkEntity({
    required this.headers,
    required this.sources,
    required this.download,
  });
  final HeadersEntity headers;
  final List<SourceEntity> sources;
  final String download;
}

class HeadersEntity {
  HeadersEntity({
    required this.referer,
  });
  final String referer;
}

class SourceEntity {
  SourceEntity({
    required this.url,
    required this.isM3U8,
    required this.quality,
  });
  final String url;
  final bool isM3U8;
  final String quality;
}
