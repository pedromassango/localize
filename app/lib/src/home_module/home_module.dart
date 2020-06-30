
import 'package:app/src/home_module/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {

  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router('/', child: (context, args) => HomePage()),
  ];
}