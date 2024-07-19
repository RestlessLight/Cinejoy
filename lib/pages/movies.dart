import 'package:cinejoy/pages/search.dart';
import 'package:cinejoy/pages/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cinejoy/theme/textStyle.dart';

import 'package:cinejoy/data/dummy_movies.dart';

import 'package:cinejoy/widgets/carousel.dart';

import 'package:cinejoy/models/movie.dart';
import 'package:flutter/widgets.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

List<Movie> get currentMovies {
  List<Movie> tempMovies = List.of(movies);
  tempMovies.removeWhere((item) =>
      item.startDate.isAfter(DateTime.now()) ||
      item.endDate.isBefore(DateTime.now()));

  return tempMovies;
}

List<Movie> get soonMovies {
  List<Movie> tempMovies = List.of(movies);
  tempMovies.removeWhere((item) =>
      item.startDate.isBefore(DateTime.now()) ||
      item.startDate.isAtSameMomentAs(DateTime.now()));
  return tempMovies;
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF191825),
            ),
          ),
          Positioned(
            top: -400,
            left: 58,
            child: Container(
              height: MediaQuery.sizeOf(context).width * 1.14,
              width: MediaQuery.sizeOf(context).width * 1.14,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    color: Color(0x40FF00E4),
                    blurRadius: 200,
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: textTheme['16'],
                        ),
                        Text(
                          'To DO - User Name',
                          style: textTheme['20 bold'],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const UserPage(),
                      ),
                    );
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/horses.png'),
                        radius: 23,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const SearchPage(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    height: 52,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search',
                          style: textTheme['16']!
                              .copyWith(color: const Color(0xFF191825)),
                        ),
                        const Icon(
                          Icons.search,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Currently in Theaters',
                  style: textTheme['20 bold'],
                ),
                const SizedBox(
                  height: 20,
                ),
                Carousel(
                  itemCount: currentMovies.length,
                  movieData: currentMovies
                      .map((item) => {'image': item.image, 'id': item.id})
                      .toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Soon',
                      style: textTheme['20 bold'],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: textTheme['14'],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Carousel(
                  itemCount: soonMovies.length,
                  movieData: soonMovies
                      .map((item) => {'image': item.image, 'id': item.id})
                      .toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
