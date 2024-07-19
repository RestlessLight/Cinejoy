class Movie {
  const Movie({
    required this.id,
    required this.image,
    required this.title,
    required this.rating,
    required this.genre,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.duration,
    required this.cast,
  });

  final String id;
  final String image;
  final String title;
  final String rating;
  final String genre;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final Duration duration;
  final String cast;
}
