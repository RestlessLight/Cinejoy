import 'package:cinejoy/pages/credit_card.dart';
import 'package:cinejoy/pages/payment_result.dart';
import 'package:flutter/material.dart';

import 'package:cinejoy/pages/auth.dart';
import 'package:cinejoy/pages/date_seat.dart';
import 'package:cinejoy/pages/search.dart';
import 'package:cinejoy/pages/splash.dart';
import 'package:cinejoy/pages/movie_details.dart';
import 'package:cinejoy/pages/movies.dart';
import 'package:cinejoy/pages/promo.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

//import 'package:cinejoy/pages/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(
        useMaterial3: false,
        //fontFamily: 'Work Sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 159, 8, 129),
        ),
        searchBarTheme: const SearchBarThemeData(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
        searchViewTheme: const SearchViewThemeData(

          backgroundColor: Color.fromARGB(255, 159, 8, 129),
          dividerColor: Colors.white,
          
        ),
      ),
      
      home: StreamBuilder(
        
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }

          if (snapshot.hasData) {
            return const MoviesPage();
          }
          
          //return const DateSeatPage();
          return const AuthScreen();
        },
      ),
     // home: const SafeArea(top: true, child: PaymentResultPage()),
    );
  }
}
