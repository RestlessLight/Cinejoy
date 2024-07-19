import 'package:flutter/material.dart';

import 'package:cinejoy/pages/movie_details.dart';


class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    required this.itemCount,
    required this.movieData,
  });

  final int? itemCount;
  final List<Map<String, String>>? movieData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.28,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (ctx, index) => Material(
          color: Colors.transparent,
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              highlightColor: Colors.transparent,
              splashColor: const Color(0x40FF00E4),
              onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => MovieDetails(id: movieData![index]['id']!,),
                          ),
                        );
                      },
              child: Ink.image(
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height * 0.28,
                width: MediaQuery.sizeOf(context).width * 0.46,
                image: NetworkImage(movieData![index]['image']!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
