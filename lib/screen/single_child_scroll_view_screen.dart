import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'SingleChildScrollView',
        body: SingleChildScrollView(
            child: Column(
              children: numbers.map((number) =>
                  renderContainer(
                    color: rainbowColors[number % rainbowColors.length],
                    index: number,
                  )).toList(),
            )
        )
    );
  }

  // 1
  // 기본 렌더링법
  Widget renserSimple(){
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors.map(
                (color) => renderContainer(color: color)
        ).toList(),
      ),
    );
  }

  // 2
  // 화면을 넘어가지 않아도 스크롤 되게하기
  Widget renderAlwaysScroll(){
    return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: renderContainer(color: Colors.black)
    );
  }

  // 3
  // 위젯이 잘리지 않게 하기
  Widget renderClip(){
    return SingleChildScrollView(
        clipBehavior: Clip.none,
        physics: AlwaysScrollableScrollPhysics(),
        child: renderContainer(color: Colors.black)
    );
  }

  // 4
  // 여러가지 physics 정리
  Widget renderPhysics(){
    return SingleChildScrollView(
        clipBehavior: Clip.none,
        // NeverScrollableScrollPhysics - 스크롤 안됨
        // AlwaysScrollableScrollPhysics - 스크롤 됨
        // BouncingScrollPhysics - iOS 스타일
        // ClampingScrollPhysics - AOS 스타일
        physics: ClampingScrollPhysics(),
        child: renderContainer(color: Colors.black)
    );
  }

  // 5
  // SingleChildScrollView 퍼포먼스
  Widget renderPerformance(){
    return SingleChildScrollView(
        child: Column(
          children: numbers.map((number) =>
              renderContainer(
                color: rainbowColors[number % rainbowColors.length],
                index: number,
              )).toList(),
        )
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }){
    if(index != null){
      print(index);
    }

    return Container(
      height: 300,
      color: color,
    );
  }
}
