class StatusModel {
  String? status;
  int? totalResults;

  List<ArticalModel>? articalList = [];

  StatusModel({
    this.status,
    this.totalResults,
    this.articalList});

  factory StatusModel.mapToModel(Map m1){
    List artical = m1['articles'];

    return StatusModel(
      status: m1['status'],
      totalResults: m1['totalResults'],
      articalList: artical.map((e) => ArticalModel.mapToModel(e)).toList()
      );
  }
}

class ArticalModel {
  String? author, title, description, url, urlToImage, publishedAt, content;
  SourceModel? sourceModel;

  ArticalModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.sourceModel,
  });

  factory ArticalModel.mapToModel(Map m1){
    return ArticalModel(
        author: m1['author'],
        title: m1['title'],
        description: m1['description'],
        url: m1['url'],
        urlToImage: m1['urlToImage'],
        publishedAt: m1['publishedAt'],
        content: m1['content'],
        sourceModel: SourceModel.mapToModel(m1['source'])
    );
  }
}

class SourceModel {
  dynamic id;
  String? name;

  SourceModel({this.id, this.name});

  factory SourceModel.mapToModel(Map m1) {
    return SourceModel(
      id: m1['id'],
      name: m1['name'],
    );
  }
}
