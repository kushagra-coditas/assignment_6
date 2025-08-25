import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:assignment_6/assets/constants/constants.dart';
import 'package:assignment_6/features/login/widgets/dial_pad.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height / 2),
            SvgPicture.asset('lib/assets/logo.svg'),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                'Limester',
                style: TextStyle(
                  fontSize: 24,
                  color: Constants().titleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Booking food is made easy through three easy steps. Browse, Order, and Track. Eat good and eat exciting.',
              style: TextStyle(fontSize: 14, color: Constants().subTextColor),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 42, 0, 42),
              child: DialPad(),
            ),
          ],
        ),
      ),
    );
  }
}
