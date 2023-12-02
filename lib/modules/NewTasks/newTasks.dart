// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/shared/bloc/cubit.dart';
import 'package:todoapp/shared/bloc/states.dart';
import 'package:todoapp/shared/components/components.dart';

class newTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    appCubit cubit = appCubit.get(context);
    return BlocConsumer<appCubit, States>(
        builder: (context, State) {
          return tasksList(tasks: cubit.NewTasks);
        },
        listener: (context, state) {});
  }
}
