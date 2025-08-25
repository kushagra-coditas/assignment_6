import 'package:flutter/material.dart';
import 'package:assignment_6/assets/constants/constants.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 62,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 237, 237, 237),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Color(0xffE9F3FB)),
          ),
          child: Icon(Icons.menu, color: Constants().titleTextColor),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
          child: Text(
            'Fresh Menu',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Constants().titleTextColor,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Icon(Icons.arrow_drop_down, color: Constants().titleTextColor),

        Padding(
          padding: const EdgeInsets.only(left: 48),
          child: Icon(
            Icons.search,
            size: 35,
            color: Constants().titleTextColor,
          ),
        ),
      ],
    );
  }
}
