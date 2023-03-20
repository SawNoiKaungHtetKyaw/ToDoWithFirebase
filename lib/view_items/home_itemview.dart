import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/demis.dart';
import 'package:todo/pages/add_todo.dart';
import 'package:todo/utils/string_extension.dart';
import 'package:todo/widgets/easy_text.dart';

import '../bloc/home_bloc.dart';
import '../data/vos/task_vo.dart';

class HomePageBannerItemView extends StatelessWidget {
  const HomePageBannerItemView({
    super.key,
    required this.taskListLength
  });
  final int taskListLength;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: Container(
        width: double.infinity,
        height: kHomeContainerHeight,
        padding: const EdgeInsets.symmetric(horizontal: kSP10x),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              kPrimaryColor,
              kSecondyColor,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(kSP100x)),
            boxShadow: [
              BoxShadow(spreadRadius: 0.9, blurRadius: 0.8, color: kShadowColor)
            ]),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.menu_rounded,
                  color: kWhite,
                  size: kIconSize40x,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddToDo(
                              id: -1,
                            ),
                          ));
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
                      color: kWhite,
                      size: kIconSize40x,
                    ))
              ],
            ),
            Expanded(
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(width: kSP5x),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EasyText(
                          text: "Today : ${DateTime.now().getDate()}",
                          textColor: kWhite,
                          fontSize: kFontSize24x,
                          fontWeight: FontWeight.w900,
                        ),
                        EasyText(
                          text: taskListLength.toString().getTaskOrTasks(),
                          textColor: kBackgroundColor,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

class ToDoCardItemView extends StatelessWidget {
  const ToDoCardItemView({super.key, required this.task});
  final TaskVo? task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(bottom: kSP5x),
      padding: const EdgeInsets.all(kSP15x),
      decoration: const BoxDecoration(color: kWhite),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EasyText(
                    text: task?.title ?? '',
                    fontWeight: FontWeight.w500,
                    textColor: kPrimaryColor,
                    fontSize: kFontSize18x,
                    overflow: TextOverflow.clip,
                  ),
                  const SizedBox(height: kSP5x),
                  SizedBox(
                    child: EasyText(
                      text: task?.description ?? '',
                      fontWeight: FontWeight.w500,
                      fontSize: kFontSize14x,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const SizedBox(height: kSP5x),
                  EasyText(
                    text: "Note : ${task?.note ?? ''}",
                    textColor: kErrorColor,
                    fontSize: kFontSize12x,
                    overflow: TextOverflow.clip,
                  ),
                  EasyText(
                    text: "${task?.date ?? ''}   ${task?.time ?? ''}",
                    fontWeight: FontWeight.w500,
                    textColor: kHintTxtColor,
                    fontSize: kFontSize12x,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddToDo(
                                id: task?.id ?? -1,
                              )));
                    },
                    child: const Icon(Icons.edit)),
                const SizedBox(height: kSP5x),
                GestureDetector(
                  onTap: () {
                    context.read<HomeBloc>().deleteTaskById(task?.id ?? -1);
                  },
                  child: const Icon(
                    Icons.delete,
                    color: kErrorColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
