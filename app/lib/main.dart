import 'package:app/src/auth_module/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/global_states/auth_state_view_model.dart';
import 'src/home_module/home_module.dart';
import 'src/home_module/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  runApp(ModularApp(
      module: AppModule(preferences: preferences),
  ),
  );
}

class LocalizeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authState = AuthStateViewModel(Modular.get<SharedPreferences>());

    return  MaterialApp(
        title: 'Localize',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xff3d405b),
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute,
        home: Observer(
          builder: (context) {
            if (authState.isLoggedIn) {
              return HomePage();
            }
            return AuthPage();
          },
        ),
      );
  }
}

class AppModule extends MainModule {
  final SharedPreferences preferences;

  AppModule({this.preferences});

  @override
  List<Bind> get binds => [
    Bind<SharedPreferences>((i) => preferences)
  ];

  @override
  Widget get bootstrap => LocalizeApp();

  @override
  List<Router> get routers => [
    Router('/home', module: HomeModule()),
    Router('/auth', child: (_, __) => AuthPage()),
  ];
}
