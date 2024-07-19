import 'package:cinejoy/pages/date_seat.dart';
import 'package:cinejoy/theme/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cinejoy/data/dummy_movies.dart';
import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final details = movies.where((movie) => movie.id == id).elementAt(0);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF191825),
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.55,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    details.image,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  colors: [
                    const Color.fromARGB(255, 115, 66, 130).withOpacity(0.5),
                    const Color.fromARGB(255, 25, 24, 37),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.13,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details.genre,
                        style: textTheme['12'],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        details.title,
                        style: textTheme['30'],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('yyyy').format(details.startDate),
                            style: textTheme['14'],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${details.duration.inHours}h ${details.duration.inMinutes.remainder(60)}m',
                            style: textTheme['14'],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            details.rating,
                            style: textTheme['14'],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'About Movie',
                        style: textTheme['20 bold'],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        details.description,
                        style: textTheme['13'],
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Cast',
                        style: textTheme['20 bold'],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        details.cast,
                        style: textTheme['13'],
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFFF00E4),
                    minimumSize: const Size(
                      double.infinity,
                      56,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => DateSeatPage(
                          id: details.id,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Buy Ticket',
                    style: textTheme['16 bold']!.copyWith(
                      color: const Color(0xFF191825),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
