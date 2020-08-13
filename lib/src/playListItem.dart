import '../youtube_api_v3.dart';

class PlayListItem {
  final String kind;
  final String etag;
  final String id;
  final Snippet snippet;
  final ContentDetails contentDetails;
  final Status status;

  PlayListItem(this.kind, this.etag, this.id, this.snippet, this.contentDetails,
      this.status);
  factory PlayListItem.fromJson(Map<String, dynamic> json) {
    return PlayListItem(
        json['kind'],
        json['etag'],
        json['id'],
        json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null,
        json['contentDetails'] != null
            ? ContentDetails.fromJson(json['contentDetails'])
            : null,
        json['status'] != null ? Status.fromJson(json['status']) : null);
  }
}
