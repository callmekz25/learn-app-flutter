import 'package:flutter/material.dart';
import 'package:khanhvinh_flutter_app/commercial_app/page_verify_otp.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

AuthResponse? response;

class PageAuthUser extends StatelessWidget {
  const PageAuthUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Auth"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: Container()),
              SupaEmailAuth(
                onSignInComplete: (res) {
                  response = res;
                  Navigator.of(context).pop();
                },
                onSignUpComplete: (response) {
                  if (response.user != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          PageVerifyOtp(email: response.user!.email!),
                    ));
                  }
                },
                showConfirmPasswordField: true,
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
