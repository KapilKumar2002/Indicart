import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:indicart/layout/screen_layout.dart';
import 'package:indicart/providers/user_details_provider.dart';
import 'package:indicart/screens/sign_in_screen.dart';
import 'package:indicart/utils/color_themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA9QQd4PAT7RR-eGcQXwfSu2w6_deZGHiA",
            authDomain: "indicart-3b4f9.firebaseapp.com",
            projectId: "indicart-3b4f9",
            storageBucket: "indicart-3b4f9.appspot.com",
            messagingSenderId: "127334501170",
            appId: "1:127334501170:web:80939d1bd67c4371cee52b",
            measurementId: "G-09QTF05JE2"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    Indicart(),
  );
}

class Indicart extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserDetailsProvider())],
      child: MaterialApp(
        title: "Amazon Clone",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> user) {
              if (user.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              } else if (user.hasData) {
                return const ScreenLayout();
                // return const SellScreen();
              } else {
                return const SignInScreen();
              }
            }),
      ),
    );
  }
}
