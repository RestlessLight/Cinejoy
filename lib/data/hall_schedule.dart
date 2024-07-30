import 'package:cinejoy/models/hall.dart';

final List<Hall> schedule = [
  Hall(
    dateStart: DateTime(2024, 07, 01),
    dateEnd: DateTime(2024, 08, 17),
    movieId: '1',
    schedule: ['11.00', '16:40', '20:00'],
  ),
  Hall(
    dateStart: DateTime(2024, 08, 17),
    dateEnd: DateTime(2024, 09, 30),
    movieId: '1',
    schedule: ['12:20', '16:50'],
  ),
  
  Hall(
    dateStart: DateTime(2024, 07, 01),
    dateEnd: DateTime(2024, 08, 17),
    movieId: '2',
    schedule: ['12:20', '16:50'],
  ),
];
