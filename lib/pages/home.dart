import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/bloc/home_bloc.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/demis.dart';
import 'package:todo/constants/strings.dart';
import 'package:todo/data/vos/task_vo.dart';
import 'package:todo/widgets/easy_text.dart';

import '../view_items/home_itemview.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: Selector<HomeBloc, List<TaskVo>>( 
            selector: (_, bloc) => bloc.getTaskList,
            builder: (_, taskList, child) =>Column(
              children: [
                ////Home Page Banner ItemView
                 HomePageBannerItemView(taskListLength:  taskList.length),
                taskList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: kSP10x),
                          shrinkWrap: true,
                          itemCount: taskList.length,
                          itemBuilder: (context, index) => ToDoCardItemView(
                            task: taskList[index],
                          ),
                        ),
                      )
                    : Center(
                        child: Column(
                          children: const [
                            SizedBox(height: kSP250x),
                            EasyText(
                              text: kNoTask,
                              fontSize: kFontSize18x,
                              textColor: kHintTxtColor,
                            ),
                          ],
                        ),
                      )
              ],
            ),
          )),
    );
  }
}

