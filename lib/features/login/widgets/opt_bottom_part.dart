import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_6/assets/constants/constants.dart';
import 'package:assignment_6/features/home/screen/home_screen.dart';
import 'package:assignment_6/features/login/providers/otp_notifier.dart';

class OtpBottomPart extends ConsumerStatefulWidget {
  const OtpBottomPart({super.key});

  @override
  ConsumerState<OtpBottomPart> createState() => _OtpBottomPartState();
}

class _OtpBottomPartState extends ConsumerState<OtpBottomPart> {
  @override
  Widget build(BuildContext context) {
    final otp = ref.watch(otpValueProvider);
    final isOtpFilled = otp.length == 6;

    return Column(
      children: [
        const SizedBox(height: 20),

        RichText(
          text: TextSpan(
            text: "If you don’t receive a code! ",
            style: const TextStyle(color: Colors.grey, fontSize: 14),
            children: [
              TextSpan(
                text: "Resend",
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (ref.read(otpProvider.notifier).validateOtp(otp)) {
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Invalid OTP')));
              }
              if (otp.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Enter OTP first')),
                );
                return;
              }
              if (isOtpFilled) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isOtpFilled
                  ? Constants().titleTextColor
                  : Color(0xffE8F1F8),
              foregroundColor: isOtpFilled ? Colors.white : Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: Text(
              "Confirm OTP",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isOtpFilled ? Colors.white : Color(0xffC1D3E1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
