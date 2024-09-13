import 'package:go_router/go_router.dart';

import '../../views/sign_up.dart';
import '../../views/home.dart';

abstract class RoutesApp {
  static final Route home = Route(name: 'home', path: '/');
  static final Route signUp = Route(name: 'signUp', path: '/signUp');
}

class Route {
  final String name;
  final String path;

  Route({required this.name, required this.path});
}

final GoRouter routers = GoRouter(
  routes: [
    GoRoute(
      name: RoutesApp.home.name,
      path: RoutesApp.home.path,
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      name: RoutesApp.signUp.name,
      path: RoutesApp.signUp.path,
      builder:(context, state) => const SignUp(),
    )
    /*GoRoute(
      name: RoutesApp.petDetails.name,
      path: RoutesApp.petDetails.path,
      builder: (context, state) {
        //final petJson = state.extra as Map<String, dynamic>;
        final pet = PetMapper.fromJsonToEntity(state.extra as String);
        return PetDetailsView(pet: pet);
      },
    ),*/
  ],
);
