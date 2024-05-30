import 'package:coodesh/database/database.dart';
import 'package:coodesh/provider.dart';
import 'package:coodesh/router.dart';
import 'package:coodesh/themes.dart';
import 'package:coodesh/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getDatabase();
  runApp(const TesteAva());
}

class TesteAva extends StatefulWidget {
  const TesteAva({super.key});

  @override
  State<TesteAva> createState() => _TesteAvaState();
}

class _TesteAvaState extends State<TesteAva> {
  @override
  void initState() {
    systemDefaut();
    super.initState();
  }

  void systemDefaut() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }

  final root = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: listProviders(),
      child: MaterialApp(
        title: 'Coodesh',
        debugShowCheckedModeBanner: false,
        theme: CoodeshThemes.appTheme(context: context),
        home: const SplashScreen(),
        onGenerateRoute: root.generateRoute,
        navigatorKey: AppRouter.navigatorKey,
      ),
    );
  }
}
