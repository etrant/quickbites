import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbites/customer/pages/Menu/menu.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quickbites/splash/pages/splash_page.dart';
import 'firebase_options.dart';
//import 'package:universal_html/js.dart' as js;
//import 'package:universal_html/html.dart' as html;

Future<void> main() async {
//  await dotenv.load(fileName: ".env");

  // js.context['googleMapsApiKey'] = dotenv.env['API_KEY'];
  // html.document.dispatchEvent(html.CustomEvent("google-maps-api-key-loaded"));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => OrderProvider(Order()),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
