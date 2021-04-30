class RelatedArticles{
  String author;
  int id;
  DateTime publishdate;
  String title;
  int categoryid;
  String summary;
  String thumbURL;
  int author_id;

  RelatedArticles({
    this.author,
    this.id,
    this.publishdate,
    this.title,
    this.categoryid,
    this.summary,
    thumbURL,
    this.author_id}
    )
  {
    this.thumbURL = "https://cdn.standardmedia.co.ke$thumbURL";
  }
  RelatedArticles.fromJson(Map<String, dynamic> Json) {
    author = Json['author'];
    id = Json['id'];
    publishdate = DateTime.parse(Json['publishdate']);
    title = Json['title'];
    categoryid = Json['categoryid'];
    summary = Json['summary'];
    thumbURL = "https://cdn.standardmedia.co.ke${Json['thumbURL']}";
    author_id = Json['author_id'];
  }

}