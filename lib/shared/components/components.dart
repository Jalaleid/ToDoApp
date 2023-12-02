// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:todoapp/shared/bloc/cubit.dart';

Color PressedIconColor = const Color.fromARGB(255, 218, 216, 216);

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType keyboaredType,
  required IconData prefix,
  required String Label,
  required FormFieldValidator validator,
  Function? onSubmitted,
  GestureTapCallback? ontap,
  IconData? suffix,
  bool? obsecure = false,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboaredType,
    obscureText: obsecure!,
    maxLines: 1,
    enableSuggestions: true,
    onFieldSubmitted: (s) {
      onSubmitted!();
    },
    onTap: ontap,
    validator: validator,
    decoration: InputDecoration(
      prefixIcon: Icon(prefix),
      suffixIcon: Icon(suffix),
      labelText: Label,
      border: const OutlineInputBorder(),
    ),
  );
}

Widget taskItem(Map task, context) {
  return Dismissible(
    key: Key(task['id'].toString()),
    onDismissed: (direction) {
      appCubit.get(context).DeleteFromDataBase(id: task['id']);
    },
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
              radius: 35,
              backgroundColor: Colors.deepOrange,
              child: Center(
                child: Text(
                  "${task['time']}",
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              )),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${task['title']}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 6),
              Text("${task['date']}"),
            ],
          )),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              appCubit
                  .get(context)
                  .UpdateDataBase(id: task['id'], status: 'done');
            },
            icon: Icon(
              Icons.done,
              color: PressedIconColor,
            ),
          ),
          IconButton(
            onPressed: () {
              PressedIconColor = Colors.green;
              appCubit
                  .get(context)
                  .UpdateDataBase(id: task['id'], status: 'archived');
            },
            icon: const Icon(
              Icons.archive,
              color: Colors.grey,
            ),
          )
        ],
      ),
    ),
  );
}

Widget tasksList({required List<Map> tasks}) {
  if (tasks.isNotEmpty) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return taskItem(tasks[index], context);
        }),
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          );
        },
        itemCount: tasks.length);
  } else {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            size: 100.0,
            color: Colors.grey,
          ),
          Text(
            'No Tasks Yet, Please Add Some Tasks',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
