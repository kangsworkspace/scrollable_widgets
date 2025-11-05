import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'ListViewScreen',
        body: renderSeperator();
    );
  }
}

// 3)
// 2 + 중간에 추가할 위젯 넣을 수 있음
// **광고 같은거  넣을 때 유용하다.
Widget renderSeperator(){
  return ListView.separated(
    itemCount: 100,
    itemBuilder: (context, index) {
      return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index
      );
    },
    separatorBuilder: (context, index) {
      index += 1;

      // 5개의 item마다 배너 보여주기
      if(index % 5 == 0){
        return renderContainer(
          color: Colors.black,
          index: index,
          height: 100,
        );
      }

      return SizedBox(height: 12);
    },
  );
}

// 2)
// 보이는 것만 그림
//
// 빌더를 사용하면 실제로 화면에 표시될때 위젯을 그리고
// 사용하지 않으면 메모리에서 위젯을 삭제한다.
//
// => 퍼포먼스가 더 좋다.
Widget renderBuilder(){
  return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index
        );
      }
  );
}

// 1)
// 기본 - 모두 한번에 그림
Widget renderDefault({
  required List<int> numbers,
}) {
  return ListView(
    children: numbers.map(
            (number) => renderContainer(
            color: rainbowColors[number % rainbowColors.length],
            index: number
        )
    ).toList(),
  );
}



Widget renderContainer({
  required Color color,
  required int index,
  double? height,
}) {
  print(index);

  return Container(
    height: height ?? 300,
    color: color,
    child: Center(
      child: Text(
        index.toString(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
      ),
    ),
  );
}