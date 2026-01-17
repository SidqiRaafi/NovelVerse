class Novel {
  String id;
  String title;
  String author;
  String genre;
  String synopsis;
  String coverUrl;
  double rating;

  Novel({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.synopsis,
    required this.coverUrl,
    required this.rating,
  });

  // From Firestore
  factory Novel.fromMap(Map<String, dynamic> map, String documentId) {
    return Novel(
      id: documentId,
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      genre: map['genre'] ?? '',
      synopsis: map['synopsis'] ?? '',
      coverUrl: map['coverUrl'] ?? '',
      rating: (map['rating'] ?? 0).toDouble(),
    );
  }

  // To Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'genre': genre,
      'synopsis': synopsis,
      'coverUrl': coverUrl,
      'rating': rating,
    };
  }
}
