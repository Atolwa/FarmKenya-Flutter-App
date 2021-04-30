class Video {
  int id;
  int categoryid;
  String title;
  String videoURL;
  DateTime publishdate;
  String keywords;

  Video(
      {this.id,
        this.categoryid,
        this.title,
        this.publishdate,
        this.keywords,
        videoURL}) {
    this.videoURL = "https://www.youtube.com/embed/$videoURL";
  }

  Video.fromJson(Map<String, dynamic> Json) {
    id = Json['id'];
    categoryid = Json['categoryid'];
    title = Json['title'];
    videoURL = "https://www.youtube.com/embed/${Json['videoURL']}";
    publishdate = DateTime.parse(Json['publishdate']);
    keywords = Json['keywords'];
  }

}
