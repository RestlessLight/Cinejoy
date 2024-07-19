import 'package:flutter/material.dart';

import 'package:cinejoy/theme/textStyle.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Sign Out',
                    style: textTheme['40'],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
