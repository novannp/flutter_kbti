class Definition {
  int id;
  String category;
  int createdAt;
  int updatedAt;
  String term;
  String definition;
  String username;
  int upVotes;
  int downVotes;

  Definition(
      {required this.id,
      required this.category,
      required this.createdAt,
      required this.updatedAt,
      required this.term,
      required this.definition,
      required this.username,
      required this.upVotes,
      required this.downVotes});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
        id: json['id'],
        category: json['category'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        term: json['term'],
        definition: json['definition'],
        username: json['username'],
        upVotes: json['up_votes'],
        downVotes: json['down_votes']);
  }
}
