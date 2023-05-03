
import 'package:cinebuy_app/model/service/auth_service.dart';
import 'package:cinebuy_app/model/service/firebase_options.dart';
import 'package:cinebuy_app/model/service/firestore_service.dart';
import 'package:cinebuy_app/utils/wrapper/wrapper.dart';
import 'package:cinebuy_app/view/screen/home/home_screen.dart';
import 'package:cinebuy_app/view/screen/home/home_view_model.dart';
import 'package:cinebuy_app/view/screen/login/login_screen.dart';
import 'package:cinebuy_app/view/screen/register/register_screen.dart';
import 'package:cinebuy_app/view/screen/saved/saved_screen.dart';
import 'package:cinebuy_app/view/screen/saved/saved_view_model.dart';
import 'package:cinebuy_app/view/screen/search/search_screen.dart';
import 'package:cinebuy_app/view/screen/search/search_view_model.dart';
import 'package:cinebuy_app/view/screen/stream/stream_screen.dart';
import 'package:cinebuy_app/view/screen/stream/stream_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        ListenableProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
        ),
        ListenableProvider<SearchViewModel>(
          create: (_) => SearchViewModel(),
        ),
        Provider<FirestoreService>(
          create: (_) => FirestoreService(),
        ),
        ListenableProvider(
          create: (_) => SavedViewModel(),
        ),
        ListenableProvider<StreamViewModel>(
          create: (_) => StreamViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cinebuy',
        theme: ThemeData.dark(useMaterial3: true),
        initialRoute: Wrapper.routeName,
        routes: {
          Wrapper.routeName: (context) => const Wrapper(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          SearchScreen.routeName: (context) => const SearchScreen(),
          SavedScreen.routeName: (context) => const SavedScreen(),
          StreamScreen.routeName: (context) => const StreamScreen(
                title: '',
              ),
        },
      ),
    );
  }
}
