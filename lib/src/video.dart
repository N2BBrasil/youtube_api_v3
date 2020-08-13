import '../youtube_api_v3.dart';

class Video {
  final String kind;
  final String etag;
  final String id;
  final SnippetVideo snippet;
  final ContentDetails contentDetails;
  final Status status;
  final Statistics statistics;

  Video(
    this.kind,
    this.etag,
    this.id,
    this.snippet,
    this.contentDetails,
    this.status,
    this.statistics,
  );

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      json['kind'],
      json['etag'],
      json['id'],
      json['snippet'] != null ? SnippetVideo.fromJson(json['snippet']) : null,
      json['contentDetails'] != null
          ? ContentDetails.fromJson(json['contentDetails'])
          : null,
      json['status'] != null ? Status.fromJson(json['status']) : null,
      json['statistics'] != null
          ? Statistics.fromJson(json['statistics'])
          : null,
    );
  }
}
