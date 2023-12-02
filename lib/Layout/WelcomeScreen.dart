// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Layout/layout.dart';
import 'package:todoapp/shared/bloc/cubit.dart';

import '../shared/bloc/states.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Image(image: AssetImage('assets/TODO.png')),
                  )),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "To-Do list",
                style: TextStyle(
                    color: Color.fromARGB(255, 7, 26, 17),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FittedBox(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return layout();
                            },
                          ));
                        },
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.only(bottom: 25),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.deepOrange,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "START",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: const Color.fromARGB(
                                          255, 245, 244, 244),
                                    ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
