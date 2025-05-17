import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:khanhvinh_flutter_app/commercial_app/page_auth_user.dart';
import 'package:khanhvinh_flutter_app/commercial_app/page_user_information.dart';
import 'package:khanhvinh_flutter_app/commercial_app/supabase.helper.dart';
import 'package:khanhvinh_flutter_app/helpers/dialog.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class PageVerifyOtp extends StatelessWidget {
  PageVerifyOtp({super.key, required this.email});
  String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Verify OTP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },

            onSubmit: (String verificationCode) async {
              response = await supabase.auth.verifyOTP(
                  type: OtpType.email, email: email, token: verificationCode);
              if (response?.session != null && response?.user != null) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => PageUserInformation(),
                  ),
                  (route) => false,
                );
              }
            }, // end onSubmit
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () async {
                showSnackBar(context, message: "Đang gửi mã OTP", seconds: 600);
                final response =
                    await supabase.auth.signInWithOtp(email: email);
                showSnackBar(context,
                    message: "Mã OTP đã gửi tới ${email}", seconds: 5);
              },
              child: Text("Gửi lại mã OTP"))
        ],
      ),
    );
  }
}
