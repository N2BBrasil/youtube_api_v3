import '../youtube_api_v3.dart';

class PlayListItemListResponse {
  final Map<String, dynamic> params;
  final String kind;
  final String etag;
  final String prevPageToken;
  final String nextPageToken;
  final PageInfo pageInfo;
  final List<Video> items;

  PlayListItemListResponse(
    this.params,
    this.kind,
    this.etag,
    this.prevPageToken,
    this.nextPageToken,
    this.pageInfo,
    this.items,
  );

  factory PlayListItemListResponse.fromJson(
      Map<String, dynamic> params, Map<String, dynamic> json) {
    return PlayListItemListResponse(
        params,
        json['kind'],
        json['etag'],
        json['prevPageToken'],
        json['nextPageToken'],
        PageInfo.fromJson(json['pageInfo']),
        List<Video>.from(json['items']
            .map((playListItem) => Video.fromJson(playListItem))
            .toList()));
  }
}
