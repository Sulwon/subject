class PostDTOTable {
  String rank;
  String audiCnt;
  String movieNm;
  String openDt;

  PostDTOTable({required this.rank,required this.audiCnt,required this.movieNm, required this.openDt});

  factory PostDTOTable.fromJson(dynamic json) => PostDTOTable(
    rank: json["rank"],
    audiCnt: json["audiCnt"],
    movieNm: json["movieNm"],
    openDt: json["openDt"],
  );

  static List<PostDTOTable> fromJsonList(List jsonList) {
    return jsonList.map((json) => PostDTOTable.fromJson(json)).toList();
  }

}