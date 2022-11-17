import 'package:flutter/cupertino.dart';
import 'package:gestion_ecurie/view/pages/home_page.dart';
import 'package:gestion_ecurie/view/pages/horses_stable.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
    routes: <GoRoute>[
      // le chemin est inscrit dans path:
      //le builder permet de savoir quel class doit être retourné selon le chemin
      //pour rajouter une route copier coller le GoRoute
      GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state){
      return const HomePage(title: 'PegasusClub');
      }
      ),
      GoRoute(
          path: '/horse_page',
          builder: (BuildContext context, GoRouterState state){
            return const HorseStable(title: 'My little poney');
          }
      ),
      GoRoute(
          path: '/event_stable',
          builder: (BuildContext context, GoRouterState state){
            return const HorseStable(title: 'Event incomming');
          }
      ),
    ]
);