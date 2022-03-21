import 'package:provider/provider.dart';
import 'package:renmoneytest/utils/locator.dart';
import 'package:renmoneytest/ui/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:renmoneytest/utils/progressBarManager/dialog_manager.dart';
import 'package:renmoneytest/utils/progressBarManager/dialog_service.dart';
import 'package:renmoneytest/utils/router/navigation_service.dart';
import 'package:renmoneytest/utils/router/router.dart';
import 'ui/screens/home/home_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  setupLocator();
  return runApp(ChangeNotifierProvider<HomeViewModel>(
    create: (_) => HomeViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HomeViewModel themeNotifier = HomeViewModel();
  var theme;
  @override
  void initState() {
    super.initState();
    theme = themeNotifier.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, theme, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'RenMoney app',
              builder: (context, child) => Navigator(
                key: locator<ProgressService>().progressNavigationKey,
                onGenerateRoute: (settings) =>
                    MaterialPageRoute(builder: (context) {
                  return ProgressManager(child: child!);
                }),
              ),
              theme: theme.getTheme(),
              navigatorKey: locator<NavigationService>().navigationKey,
              home: const AnimatedSplashScreen(),
              onGenerateRoute: generateRoute,
            ));
  }
}
