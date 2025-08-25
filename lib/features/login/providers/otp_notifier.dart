import 'package:assignment_6/features/login/providers/otp_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPNotifier extends StateNotifier<OTPState> {
  Future<void> loadedOTP() async {
    await Future.delayed(Duration(seconds: 2));
    state = OTPLoadedState();
  }

  OTPNotifier() : super(OTPLoadingState()) {
    loadedOTP();
  }

  bool validateOtp(String s) {
    if (s == '555555') {
      return true;
    }
    return false;
  }
}

final otpProvider = StateNotifierProvider<OTPNotifier, OTPState>(
  (ref) => OTPNotifier(),
);

final otpValueProvider = StateProvider<String>((ref) => '');
