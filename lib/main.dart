import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_lessons_from_youtube/logic/question_bloc.dart';
import 'package:some_lessons_from_youtube/repository/carbolator_repository_impl.dart';
import 'package:some_lessons_from_youtube/ui/Router/app_router.dart';

void main() {
  runApp(
      MyApp(
          appRouter: AppRouter()
      )
  );
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;

  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CarbolatorRepositoryImpl(),
      child: BlocProvider<QuestionBloc>(
          create: (context) =>
              QuestionBloc(
                  carbolatorRepository: context.read<CarbolatorRepositoryImpl>()
              ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Learning BloC!!!",
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity
            ),
            onGenerateRoute: appRouter.onGenerateRoute,
          )
      ),
    );
  }
}
