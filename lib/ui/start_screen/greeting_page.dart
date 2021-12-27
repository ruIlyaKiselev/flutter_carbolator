import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_lessons_from_youtube/logic/question_bloc.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<QuestionBloc>().add(QuestionsFetchedEvent());
    return BlocListener<QuestionBloc, QuestionState>(
      listener: (context, state) {
        if (state is LoadedState) {
          Navigator.of(context).pushReplacementNamed(
              "/start"
          );
        }
      },
      child: Scaffold(
          backgroundColor: const Color(0xff006e91),
          body: SizedBox(
              width: double.infinity,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 150,
                    ),
                    Image.asset(
                      "assets/greeting_image.png",
                      width: 250,
                      height: 250,
                    ),
                    Expanded(
                        child: Container()
                    ),
                    const Text(
                      "КАРБОЛЯТОР",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Color(0xffcdf2ff),
                          fontWeight: FontWeight.w800,
                          fontSize: 40
                      ),
                    ),
                    Container(
                      height: 50,
                    ),
                  ]
              )
          )
      ),
    );
  }
}