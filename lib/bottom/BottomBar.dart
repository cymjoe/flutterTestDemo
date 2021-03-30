import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  double height;
  Animation<double> animation;
  Animation<double> animation2;
  AnimationController controller;
  AnimationController controller2;
  double maxHeight = 800.0;
  double minHeight = 80.0;

  @override
  void initState() {
    //初始化一个补间动画 实例化一个补间类动画的实例，明确需要变换的区间大小和作用的controller对象

    //初始化一个补间动画 实例化一个补间类动画的实例，明确需要变换的区间大小和作用的controller对象

    setState(() {
      height = 80;
    });
    super.initState();
  }

  var n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: Container()),
            GestureDetector(
              onVerticalDragEnd: (DragEndDetails details) {
                double aa = maxHeight - minHeight;

                if (height > minHeight + ((maxHeight - minHeight) / 2)) {
                  n = (maxHeight - height).abs() * 500 ~/ aa;
                  controller = AnimationController(
                      duration: Duration(milliseconds: n), vsync: this);
                  animation = Tween<double>(begin: height, end: maxHeight)
                      .animate(controller);
                  animation.addListener(() {
                    setState(() {
                      height = animation.value;
                    });
                  });
                  controller.forward();
                } else {
                  n = (minHeight - height).abs() * 500 ~/ aa;
                  controller2 = AnimationController(
                      duration: Duration(milliseconds: n), vsync: this);
                  animation2 = Tween<double>(begin: height, end: minHeight)
                      .animate(controller2);
                  animation2.addListener(() {
                    setState(() {
                      height = animation2.value;
                    });
                  });
                  controller2.forward();
                }
              },
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  if (height - details.primaryDelta >= minHeight &&
                      height - details.primaryDelta <= maxHeight) {
                    height -= details.primaryDelta;
                  }
                });
              },
              child: SizedBox(
                height: height,
                child: Container(
                  color: Colors.blue,
                  child: CustomScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverGrid(
                        delegate: _mySliverChildBuilderDelegate(),
                        gridDelegate:
                            _mySliverGridDelegateWithFixedCrossAxisCount(),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_mySliverChildBuilderDelegate() {
  return SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return Container(
        height: 50,
        color: Colors.primaries[index % 8],
      );
    },
    childCount: 20,
  );
}

_mySliverGridDelegateWithFixedCrossAxisCount() {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 5,
    childAspectRatio: 1.5,
  );
}

_mySliverGridDelegateWithMaxCrossAxisExtent() {
  return SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    mainAxisSpacing: 10,
    crossAxisSpacing: 5,
    childAspectRatio: 1,
  );
}
