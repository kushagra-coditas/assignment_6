import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPBox extends ConsumerWidget {
  final TextEditingController otpController;
  final ValueChanged<String>? onChanged;
  const OTPBox({
    super.key,
    required this.onChanged,
    required this.otpController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 42.5,
      height: 50,
      child: TextField(
        controller: otpController,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff37B890),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 220, 239, 255),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
