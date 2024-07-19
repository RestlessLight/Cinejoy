import 'package:cinejoy/data/dummy_movies.dart';
import 'package:cinejoy/models/movie.dart';
import 'package:cinejoy/pages/movie_details.dart';
import 'package:cinejoy/theme/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:searchable_listview/searchable_listview.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF191825),
            ),
          ),
          Positioned(
            top: -1100,
            left: -300,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 2,
              width: MediaQuery.sizeOf(context).width * 3,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    color: Color(0x6BFF00E4),
                    blurRadius: 200,
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.9,
                    child: SearchableList<Movie>(
                      initialList: movies,
                      builder: (movies, index, item) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              item.title,
                              style: textTheme['16 bold'],
                            ),
                          ),
                          minVerticalPadding: 10,
                          subtitle: Text(
                            item.description,
                            style: textTheme['13'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => MovieDetails(id: item.id),
                              ),
                            );
                          }),
                      filter: (value) => movies
                          .where(
                            (element) =>
                                element.title.toLowerCase().contains(value),
                          )
                          .toList(),
                      emptyWidget: Text(
                        'Nothing found',
                        style: textTheme['16'],
                      ),
                      inputDecoration: InputDecoration(
                        constraints: const BoxConstraints(maxHeight: 62),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                        suffixIconColor: const Color(0xFF191825),
                        hintText: 'Search...',
                        hintStyle: textTheme['16']!.copyWith(
                          color: const Color(0xFF191825),
                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
