class Statistics {
  final String viewCount;
  final String likeCount;
  final String dislikeCount;

  Statistics(this.viewCount, this.likeCount, this.dislikeCount);

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      json['viewCount'],
      json['likeCount'],
      json['dislikeCount'],
    );
  }
}
