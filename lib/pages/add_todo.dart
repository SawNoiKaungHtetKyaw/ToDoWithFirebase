import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/bloc/add_todo_bloc.dart';
import 'package:todo/constants/demis.dart';
import 'package:todo/constants/strings.dart';
import 'package:todo/view_items/add_new_task_itemview.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/developed_by_recoding.dart';
import 'package:todo/widgets/easy_text_field.dart';

import '../constants/colors.dart';
import '../widgets/date_time_picker.dart';
import '../widgets/loading_alert.dart';

class AddToDo extends StatelessWidget {
  const AddToDo({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    // TextEditingController _titleController;
    // TextEditingController _descriptionController;
    // TextEditingController _noteController;

    return ChangeNotifierProvider<AddTodoBloc>(
      create: (context) => AddTodoBloc(id),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ////App Bar Item View
              const AddNewTaskItemView(),

              ///Add New Task Container box
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(top: kSP100x),
                padding: const EdgeInsets.symmetric(
                    horizontal: kSP20x, vertical: kSP50x),
                decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kSP50x),
                        topRight: Radius.circular(kSP50x))),
                child: Consumer<AddTodoBloc>(builder: (_, bloc, child) {
                  // _titleController = TextEditingController(text: bloc.getTitle);
                  // _descriptionController =
                  //     TextEditingController(text: bloc.getDescription);
                  // _noteController = TextEditingController(text: bloc.getNote);
                  return Form(
                    key: _key,
                    child: Column(
                      children: [
                        ///Enter Title Text Field
                        AddTaskTextField(
                          lableText: kEnterTitle,
                          validate: (value) {},
                          data: bloc.getTitle,
                          onChanged: (value) {
                            bloc.setTitle(value);
                          },
                        ),

                        const SizedBox(height: kSP15x),

                        ///Enter Description Text Field
                        AddTaskTextField(
                          lableText: kEnterDescription,
                          maxLines: 5,
                          validate: (value) {},
                          data: bloc.getDescription,
                          onChanged: (value) {
                            bloc.setDescription(value);
                          },
                        ),

                        const SizedBox(height: kSP15x),

                        ///Enter Note Text Field
                        AddTaskTextField(
                          lableText: kEnterNote,
                          maxLines: 3,
                          validate: (value) {},
                          data: bloc.getNote,
                          onChanged: (value) {
                            bloc.setNote(value);
                          },
                        ),

                        const SizedBox(height: kSP15x),

                        ////Date Picker
                        DateAndTimePickerItemView(
                          title: kDate,
                          dateOrTime: bloc.getDate,
                          icon: Icons.date_range,
                          onTap: () async {
                            //get Date from Date Picker
                            DateTime? picker =
                                await getDatePicker(context) ?? DateTime.now();

                            //get Date Method from AddToDo Bloc
                            bloc.getDateMethod(picker);
                          },
                        ),

                        const SizedBox(height: kSP15x),

                        ////Time Picker
                        DateAndTimePickerItemView(
                          title: kTime,
                          dateOrTime: bloc.getTime,
                          icon: Icons.timer_outlined,
                          onTap: () async {
                            //get time from Time Picker
                            TimeOfDay? picker =
                                await getTimePicker(context) ?? TimeOfDay.now();

                            //get Time Method from AddToDo Bloc
                            bloc.getTimeMethod(picker);
                          },
                        ),

                        const SizedBox(height: kSP15x),

                        Consumer<AddTodoBloc>(
                          builder: (_, bloc, child) => CustomButton(
                              text: id == -1 ? kAddNewTask : kEditTask,
                              onTap: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) =>
                                        const LoadingAlertDialogWidget());
                                bloc.onTapAddNewTask().then((value) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                }).catchError((error) {
                                  Navigator.of(context).pop();
                                });
                              }),
                        ),
                        const SizedBox(height: kSP100x),

                        const DevelopedByReCoding()
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
