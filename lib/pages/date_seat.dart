import 'dart:developer';

import 'dart:convert';

import 'package:cinejoy/pages/credit_card.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cinejoy/widgets/day_button.dart';
import 'package:cinejoy/data/hall_schedule.dart';
import 'package:cinejoy/data/dummy_movies.dart';
import 'package:cinejoy/theme/textStyle.dart';
import 'package:cinejoy/widgets/cinema_screen.dart';
import 'package:cinejoy/widgets/seat_button.dart';
import 'package:cinejoy/widgets/timeButton.dart';

final db = FirebaseFirestore.instance;

class DateSeatPage extends ConsumerStatefulWidget {
  const DateSeatPage({super.key, required this.id,});

  final String id;
  
  @override
  ConsumerState<DateSeatPage> createState() {
    return _DateSeatPageState();
  }
}

class _DateSeatPageState extends ConsumerState<DateSeatPage> {
  var pressedSeats;
  bool _isSeatsUpdating = true;
  late List thisSchedule;
  var pickedDate;
  var pickedTime;
  late String movieName;

  void updateTime() {
    for (int i = 0; i < thisSchedule.length; i++) {
      if (dateList.isEmpty) {
        break;
      } else if (dateList[selectedIndexDate]
              .isAfter(thisSchedule[i].dateStart) &&
          dateList[selectedIndexDate].isBefore(thisSchedule[i].dateEnd)) {
        chosenDateSchedule = thisSchedule[i].schedule;
        pickedTime = thisSchedule[i].schedule[0];
        break;
      } else {
        continue;
      }
    }
  }

  void checkSeats() async {
    _isSeatsUpdating = true;
    var snap = await db
        .collection('seatsStatus')
        .doc('Hall 1')
        .collection(DateFormat('yyyy-MM-dd').format(pickedDate))
        .doc(pickedTime)
        .get();

    print(inspect(snap));

    if (snap.exists == false) {
      setState(() {
        pressedSeats = [
          List.generate(10, (index) => "free"),
          List.generate(9, (index) => "free"),
          List.generate(10, (index) => "free"),
          List.generate(9, (index) => "free"),
        ];
        _isSeatsUpdating = false;
        print('Empty');
      });
    } else {
      setState(() {
        print(jsonDecode(snap['seats']));
        pressedSeats = jsonDecode(snap['seats']);
        //List<List<String>> pressedSeats = jsonDecode(snap['seats']);

        _isSeatsUpdating = false;
      });
    }
    print(inspect(pressedSeats));
  }

  @override
  void initState() {
    thisSchedule = schedule.where((hall) => hall.movieId == widget.id).toList();
    movieName =  movies.firstWhere((element) => element.id == widget.id).title;
    print('Movie name - $movieName');
    print(inspect(movieName));
    print(inspect(thisSchedule));

    var start = DateTime.now();
    var end = thisSchedule[thisSchedule.length - 1].dateEnd;
    while (start.isBefore(end)) {
      dateList.add(start);
      start = start.add(
        const Duration(days: 1),
      );
    }
    pickedDate = dateList[0];
    updateTime();
    checkSeats();

    super.initState();
  }

  var isPressedDate = false;
  var isPressedTime = false;

  int selectedIndexDate = 0;
  int selectedIndexTime = 0;
  int tickeCount = 0;

  List choosenSeats = [];
  List<String> chosenDateSchedule = [];
  final List<DateTime> dateList = [];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    //print('Schedule data - ${inspect(thisSchedule)}');

    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF191825),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.4,
              left: -MediaQuery.sizeOf(context).width * 0.99,
              child: const CinemaScreen(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Book Ticket',
                        style: textTheme['16'],
                      ),
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.transparent,
                        size: 24,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Date and time',
                    style: textTheme['20 bold'],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 82,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dateList.length,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          //isPressedDate = !isPressedDate;
                          selectedIndexDate = index;
                          pickedDate = dateList[index];
                          updateTime();
                          checkSeats();
                        });
                      },
                      child: DayButton(
                        date: dateList[index],
                        selectedIndex: selectedIndexDate,
                        id: thisSchedule[0].movieId,
                        index: index,
                        dayName: DateFormat('EEE').format(dateList[index]),
                        dayNumber:
                            (DateTime.parse(dateList[index].toString()).day)
                                .toString(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 36,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: chosenDateSchedule.length,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          //isPressedTime !=isPressedTime;
                          selectedIndexTime = index;
                          pickedTime = chosenDateSchedule[index];
                          //updateTime();
                          checkSeats();
                          print(pickedTime);
                        });
                      },
                      child: TimeButton(
                        index: index,
                        selectedIndexTime: selectedIndexTime,
                        time: chosenDateSchedule[index],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                Center(
                  child: _isSeatsUpdating
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          itemBuilder: (ctx, index) => SizedBox(
                            height: 34,
                            child: Center(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: index % 2 == 0 ? 10 : 9,
                                itemBuilder: ((context, index2) =>
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (pressedSeats[index][index2] ==
                                              "free") {
                                            pressedSeats[index][index2] =
                                                "taken";
                                            choosenSeats.add({
                                              'row': index,
                                              'seat': index2,
                                            });
                                            tickeCount++;
                                            print(inspect(choosenSeats));
                                          } else if (pressedSeats[index]
                                                  [index2] ==
                                              "taken") {
                                            pressedSeats[index][index2] =
                                                "free";
                                            choosenSeats.removeWhere(
                                                (element) =>
                                                    element['row'] == index &&
                                                    element['seat'] == index2);
                                            tickeCount--;
                                            //print(choosenSeats);
                                          } else {
                                            return;
                                          }
                                        });
                                      },
                                      child: SeatButton(
                                        pressedSeats: pressedSeats,
                                        i1: index,
                                        i2: index2,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            height: 17,
                            width: 17,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Availeble',
                            style: textTheme['14'],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF00E4),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            height: 17,
                            width: 17,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Selected',
                            style: textTheme['14'],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF403E5B),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            height: 17,
                            width: 17,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Reserved',
                            style: textTheme['14'],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price:',
                            style: textTheme['16'],
                          ),
                          Text(
                            '\$${tickeCount * 100}.00',
                            style: textTheme['16 bold'],
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFF00E4),
                          minimumSize:
                              Size(MediaQuery.sizeOf(context).width * 0.66, 60),
                          maximumSize:
                              Size(MediaQuery.sizeOf(context).width * 0.66, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                        ),
                        onPressed: () {
                          print(pickedTime);
                          var newSeats = jsonEncode(pressedSeats);
                          newSeats = newSeats.replaceAll("taken", "busy");

                          // db
                          //     .collection('seatsStatus')
                          //     .doc('Hall 1')
                          //     .collection(
                          //         DateFormat('yyyy-MM-dd').format(pickedDate))
                          //     .doc(pickedTime)
                          //     .set({'seats': newSeats });

                          tickeCount > 0
                              ? Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => CreditCardPage(
                                      seats: newSeats,
                                      pickedDate: pickedDate,
                                      pickedTime: pickedTime,
                                      choosenSeats: choosenSeats,
                                      movie: movieName,
                                    ),
                                  ),
                                )
                              : () {};
                        },
                        child: Text(
                          'Buy Ticket',
                          style: textTheme['16 bold']!.copyWith(
                            color: const Color(0xFF191825),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
