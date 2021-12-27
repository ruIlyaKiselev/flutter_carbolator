
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some_lessons_from_youtube/ui/finish_screen/finish_page.dart';
import 'package:some_lessons_from_youtube/ui/game_screen/game_page.dart';
import 'package:some_lessons_from_youtube/ui/start_screen/greeting_page.dart';
import 'package:some_lessons_from_youtube/ui/start_screen/start_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/greeting':
        return MaterialPageRoute(
            builder: (_) => const GreetingWidget()
        );
      case '/start':
        return MaterialPageRoute(
            builder: (_) => const StartWidget()
        );
      case '/game':
        return MaterialPageRoute(
            builder: (_) => const GameWidget()
        );
      case '/finish':
        return MaterialPageRoute(
            builder: (_) => const FinishWidget()
        );
      default: return MaterialPageRoute(
          builder: (_) => const GreetingWidget()
      );
    }
  }
}