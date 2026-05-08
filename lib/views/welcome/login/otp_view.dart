import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  String code = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      onChanged: (value) {},
      onCompleted: (value) {
        print("OTP: $value");
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 55,
        fieldWidth: 45,
        activeColor: Colors.grey,
        selectedColor: Colors.grey.shade300,
        inactiveColor: Colors.grey.shade300,
        inactiveFillColor: Colors.grey.shade300,
        activeFillColor: Colors.grey.shade300,
        selectedFillColor: Colors.grey.shade300,
      ),
      enableActiveFill: true,
      obscureText: false,
    );
  }
}
