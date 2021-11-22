import 'package:flutter/material.dart';
import 'package:some_lessons_from_youtube/ui/Router/app_router.dart';
import 'package:some_lessons_from_youtube/ui/StartScreen/greeting_page.dart';

void main() {
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false,
        home: GreetingWidget(),
        onGenerateRoute: AppRouter().onGenerateRoute,
      )
  );
}
