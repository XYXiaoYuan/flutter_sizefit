import 'package:flutter/material.dart';
import 'package:flutter_sizefit/flutter_sizefit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    SizeFit.initialize();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter_SizeFit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ExampleWidget(title: 'FlutterSizeFit示例');
  }
}

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  @override
  Widget build(BuildContext context) {
    printScreenInformation();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.rpx),
                  width: 375.rpx,
                  height: 200.rpx,
                  color: Colors.red,
                  child: Text(
                    '我的宽度:${375.rpx} \n'
                    '我的高度:${200.rpx}',
                    style: TextStyle(
                        color: Colors.white, fontSize: 24.sp),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.rpx),
                  width: 375.rpx,
                  height: 200.rpx,
                  color: Colors.blue,
                  child: Text(
                      '我的宽度:${375.rpx} \n'
                      '我的高度:${200.rpx}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp)),
                ),
              ],
            ),
            Text('设备物理宽度:${SizeFit.screenWidth}pt'),
            Text('设备物理高度:${SizeFit.screenHeight}pt'),
            Text('设备逻辑宽度:${SizeFit.physicalWidth}px'),
            Text('设备逻辑高度:${SizeFit.physicalHeight}px'),
            Text('设备的像素密度:${SizeFit.dpr}'),
            Text('底部安全区距离:${SizeFit.bottomBarHeight}pt'),
            Text('状态栏高度:${SizeFit.statusBarHeight}pt'),

            SizedBox(
              height: 100.rpx,
            ),
            Text('系统的字体缩放比例:${SizeFit.textScaleFactor}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('我的文字大小在设计稿上是24px，不会随着系统的文字缩放比例变化',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                    )),
                Text('我的文字大小在设计稿上是24px，是会随着系统的文字缩放比例变化',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.ssp)),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.title),
        onPressed: () {},
      ),
    );
  }

  void printScreenInformation() {
    print('设备物理宽度:${SizeFit.screenWidth}'); //Device width
    print('设备物理高度:${SizeFit.screenHeight}'); //Device height
    print('设备的像素密度:${SizeFit.dpr}'); //Device pixel density
    print(
        '底部安全区距离:${SizeFit.bottomBarHeight}pt'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        '状态栏高度:${SizeFit.statusBarHeight}pt'); //Status bar height , Notch will be higher Unit px

    print('系统的字体缩放比例:${SizeFit.textScaleFactor}');
  }
}

