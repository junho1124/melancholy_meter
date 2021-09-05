import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melancholy_meter/repository/diary_repository.dart';
import 'package:melancholy_meter/view_model/diary_page_view_model.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final repository = DiaryRepository();
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DiaryPageViewModel(repository));
    return Scaffold(
      appBar: AppBar(
        title: Text('내 매모'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          itemCount: controller.memoItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              /*TODO 수정버튼을 누르면 기분미터와 메모를 수정 할 수 있게 subtitle이 TextField로
                 바뀌게 수정 하고 기분 미터는 점으로 표시되며 색깔로 기분 표시, 수정버튼이 눌리면 터치가 가능 해지고
                 터치하면 색이 바뀌며 수정가능하게 */
              //reading 에 색깔 인디케이터 표시하기
              title: Text(controller.memoItems.keys.toList()[index]),
              subtitle: controller.isTab.contains(index)
                  ? TextField(controller: textController)
                  : Text(controller.memoItems.values.toList()[index]),
              trailing: controller.isTab.contains(index)
                  ? IconButton(
                      onPressed: () {
                        controller.reviseMemo(
                            controller.memoItems.keys.toList()[index],
                            textController.text);
                      },
                      icon: Icon(Icons.check))
                  : IconButton(
                      onPressed: () {
                        controller.tabbed(index);
                      },
                      icon: Icon(Icons.arrow_forward_outlined),
                    ),
            );
          },
        ),
      ),
    );
  }
}
