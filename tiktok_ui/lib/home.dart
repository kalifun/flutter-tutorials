import 'package:flutter/material.dart';
import 'package:tiktok_ui/widgets/actions_toolbar.dart';
import 'package:tiktok_ui/widgets/bottom_toolbar.dart';
import 'package:tiktok_ui/widgets/video_description.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [topSection, middleSection(), BottomToolbar()],
      ),
    );
  }

  // 中间
  Expanded middleSection() {
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [VideoDescription(), ActionsToolbar()],
    ));
  }

  // 头部
  // Container topSection() {
  //   return Container(
  //     height: 100.0,
  //     padding: EdgeInsets.only(bottom: 15.0),
  //     color: Colors.yellow[300],
  //   );
  // }

  Widget get topSection => Container(
        height: 100,
        padding: EdgeInsets.only(bottom: 15),
        alignment: Alignment(
          0.0,
          1.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Following'),
            Container(
              width: 15,
            ),
            Text(
              'For you',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}
