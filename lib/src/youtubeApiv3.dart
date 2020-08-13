library youtube_api_v3;

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../youtube_api_v3.dart';

class YoutubeAPIv3 {
  final String key;

  YoutubeAPIv3(this.key);

  static const apiUrl = 'https://www.googleapis.com/youtube/v3';

  Future<PlayListItemListResponse> playListItems({
    @required String playlistId,
    @required int maxResults,
    Map<String, dynamic> requestParams,
  }) async {
    final params = requestParams ??
        {
          'key': key,
          'playlistId': playlistId,
          'maxResults': maxResults,
          'part': 'snippet,contentDetails,status,id',
        };

    final response = await get(
      '$apiUrl/playlistItems?${linkFromParams(params)}',
    );

    return PlayListItemListResponse.fromJson(
      params,
      jsonDecode(response.body),
    );
  }

  Future<List<Video>> videos(String id) async {
    final params = {
      'key': key,
      'id': id,
      'part': 'snippet,contentDetails,statistics,status',
    };

    final response = await get(
      '$apiUrl/videos?${linkFromParams(params)}',
    );

    final listResponse = VideoListResponse.fromJson(jsonDecode(response.body));

    return listResponse.items;
  }

  static String linkFromParams(Map<String, dynamic> params) {
    return params.keys.map((key) => '$key=${params[key]}').join('&');
  }
}
