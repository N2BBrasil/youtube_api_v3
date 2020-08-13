import '../youtube_api_v3.dart';

class VideoListResponse {
  final String kind;
  final String etag;
  final PageInfo pageInfo;
  final List<Video> items;
  VideoListResponse(this.kind, this.etag, this.pageInfo, this.items);

  factory VideoListResponse.fromJson(Map<String, dynamic> json) {
    return VideoListResponse(
      json['kind'],
      json['etag'],
      PageInfo.fromJson(json['pageInfo']),
      List<Video>.from(
        json['items'].map((video) => Video.fromJson(video)).toList(),
      ),
    );
  }
}
