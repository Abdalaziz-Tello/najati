import 'dart:async';

import 'package:flutter/material.dart';
import 'package:najati_test/create_child.dart';
import 'package:najati_test/features/Auth/data/model/verify_request_model.dart';
import 'package:najati_test/get_child.dart';
import 'package:najati_test/main.dart';

import '../custom_widget.dart';
import '../models/response/auth/verify_response.dart';
import 'Auth/data/data_sources/remote_data_source.dart';
import 'Auth/data/model/verify_response_model.dart';

class Verify2 extends StatefulWidget {
  Verify2({super.key, required this.phone});
  String phone;
  @override
  State<Verify2> createState() => _Verify2State();
}

class _Verify2State extends State<Verify2> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  String code = "";
  final TextStyle verifyStyle = const TextStyle(fontWeight: FontWeight.bold);
  int _secondsLeft = 15;
  bool _isVerifying = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _secondsLeft = 15;
      _isVerifying = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }

  void _handleError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Verify2(phone: widget.phone)),
      );
    });
  }

  Future<void> _verifyCode() async {
    code = _controllers.map((c) => c.text).join();

    if (code.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يرجى إدخال رمز مكون من 6 أرقام")),
      );
      return;
    }

    _startTimer();

    try {
      final model = {
        "phone": widget.phone,
        "code": code,
        "role_id": 2.toString(),
      };
      final result = await RegisterService().verify(model);

      if (result is VerifyResponseModel && result.status == "success") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => CreateChild()),
        );
      } else if (result.status == "failure") {
        _handleError(result.message);
      } else {
        _handleError("استجابة غير متوقعة من الخادم");
      }
    } catch (e) {
      _handleError("حدث خطأ أثناء التحقق، يرجى المحاولة لاحقًا");
    }
  }

  Widget _buildOtpField(int index) {
    return Container(
      width: screenW * 0.115,
      height: screenW * 0.11,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Color(0xFFD6E0F2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: verifyStyle.copyWith(fontSize: 16),
        decoration: InputDecoration(counterText: '', border: InputBorder.none),
        onChanged: (value) {
          if (value.length == 1 && index < 5) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopRightCircle(),
          LeftBottomCircle(),
          RightBottomCircle(),
          Positioned(
            right: screenW * 0.02,
            top: screenH * 0.12,
            bottom: 20,
            left: screenW * 0.02,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("تسجيل الدخول", style: verifyStyle),
                  SizedBox(height: screenH * 0.1),
                  Container(
                    width: screenW * 0.9,
                    decoration: BoxDecoration(
                      color: Color(0x73C2CEE3).withOpacity(0.45),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 18,
                          color: Color(0x73C2CEE3).withOpacity(0.45),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/Boo.png',
                              height: screenH * 0.12,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: screenH * 0.03),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "سيتم إرسال رمز التحقق عبر الرسائل يرجى التحقق",
                              style: verifyStyle.copyWith(fontSize: 11),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 3.0,
                              right: 10,
                            ),
                            child: Text(
                              "رمز التحقق",
                              style: verifyStyle.copyWith(fontSize: 11),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(6, _buildOtpField),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenH * 0.05,
                              vertical: screenH * 0.05,
                            ),
                            child: Text(
                              "إرسال الرمز مرة أخرى",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenH * 0.15),
                  SizedBox(
                    width: screenW * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        code = _controllers.map((c) => c.text).join();
                        print("Entered OTP: $code");
                        //
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => CreateChild(),
                        //   ),
                        // );
                        // RegisterService reg = RegisterService();
                        // VerifyRequestModel model = VerifyRequestModel(
                        //   phone: int.parse(widget.phone),
                        //   code: int.parse(code),
                        //   roleId: 2,
                        // );
                        // reg.verify(model);
                        _verifyCode();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("التالي", style: verifyStyle),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
