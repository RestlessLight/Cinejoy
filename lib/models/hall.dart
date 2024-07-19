class Hall {
  const Hall({required this.dateStart, required this.dateEnd, required this.movieId, required this.schedule});

  final DateTime dateStart;
  final DateTime dateEnd;
  final String movieId;
  final List<String> schedule;
}