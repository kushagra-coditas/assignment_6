import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:assignment_6/features/login/screens/otp_screen.dart';

class DialPad extends StatelessWidget {
  DialPad({super.key});

  @override
  Widget build(BuildContext context) {
    final numberController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Image(image: AssetImage('lib/assets/images/india.png')),
                SizedBox(width: 6),

                Icon(Icons.arrow_drop_down, size: 20, color: Colors.grey),

                SizedBox(width: 6),

                Text(
                  "+91",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),

                SizedBox(width: 8),

                Container(height: 20, width: 1, color: Colors.grey.shade300),

                SizedBox(width: 8),

                Flexible(
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    controller: numberController,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(width: 12),

        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: GestureDetector(
            onTap: () {
              if (numberController.text.length < 10 ||
                  numberController.text.length > 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Enter 10 Digit number !')),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtpScreen()),
                );
              }
            },
            child: Icon(Icons.arrow_forward, color: Colors.white, size: 22),
          ),
        ),
      ],
    );
  }
}
