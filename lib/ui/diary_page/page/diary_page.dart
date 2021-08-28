import 'package:flutter/material.dart';
import 'package:melancholy_meter/view_model/diary_page_view_model.dart';
import 'package:provider/provider.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  void initState() {
    super.initState();
    context.read<DiaryPageViewModel>().getMemoItems();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<DiaryPageViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('내 매모'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          itemCount: viewModel.memoItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              /*TODO 수정버튼을 누르면 기분미터와 메모를 수정 할 수 있게 subtitle이 TextField로
                 바뀌게 수정 하고 기분 미터는 점으로 표시되며 색깔로 기분 표시, 수정버튼이 눌리면 터치가 가능 해지고
                 터치하면 색이 바뀌며 수정가능하게 */
                title: Text(viewModel.memoItems.keys.toList()[index]),
                subtitle: Text(viewModel.memoItems.values.toList()[index]),
                trailing: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_outlined),),

            );
          },
        ),
      ),
    );
  }
}
