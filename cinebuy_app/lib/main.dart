import 'package:cinebuy_app/model/service/firebase_options.dart';
import 'package:cinebuy_app/view/screen/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  /// Dengan memanggil WidgetsFlutterBinding.ensureInitialized(), kita memastikan bahwa binding framework Flutter telah siap digunakan sebelum kode aplikasi Flutter dijalankan, sehingga mencegah kesalahan yang mungkin terjadi jika kita mencoba menggunakan fungsi framework sebelum framework siap digunakan.
  WidgetsFlutterBinding.ensureInitialized();

  /// Dengan memanggil Firebase.initializeApp(), kita memastikan bahwa Firebase telah siap digunakan sebelum kode aplikasi Flutter dijalankan, sehingga mencegah kesalahan yang mungkin terjadi jika kita mencoba menggunakan fungsi Firebase sebelum Firebase siap digunakan.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinebuy',
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
      },
    );
  }
}
