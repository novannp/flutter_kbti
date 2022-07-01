class Term {
  String term;
  Term({required this.term});

  factory Term.fromJson(Map<String, dynamic> json) {
    return Term(term: json['term']);
  }
}
