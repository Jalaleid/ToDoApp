// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/shared/bloc/cubit.dart';
import 'package:todoapp/shared/bloc/states.dart';
import 'package:todoapp/shared/components/components.dart';

class archivedTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    appCubit cubit = appCubit.get(context);
    return BlocConsumer<appCubit, States>(
        builder: (context, State) {
          return tasksList(tasks: cubit.ArchivedTasks);
        },
        listener: (context, state) {});
  }
}
