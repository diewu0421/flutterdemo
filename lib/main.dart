import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdemo/CuperRouter.dart';
import 'package:flutterdemo/MyCheckbox.dart';
import 'package:flutterdemo/MyMaterialApp.dart';
import 'package:flutterdemo/Test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyMaterialApp();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          platform: TargetPlatform.iOS),

      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          final name = settings.name;

          switch (name) {
            case "cuper":
              return CuperRoute();

            case "tapbox":
              return ScrollViewRoute();

            case "inherit":
              return TestInheriteRoute();

            case "gesture":
              return GestureDetectorTestRoute();

            case "animation":
              return AnimationRoute();

            case "route_switch":
              return CustomPainterRoute();

            default:
              return MyHomePage(
                title: "我是titlea",
              );
          }
        });
      },
      initialRoute: "route_switch",
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  BuildContext selfContext;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    print("build $context");

    selfContext = context;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Builder(
              builder: (context) {
                print("builder context ${context} ${selfContext == context}");

                return Text("11111111111");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
//          Navigator.of(context).pushNamed("tapbox");
//          final result = await showCustomDialog((context) => Theme(
//                data: ThemeData(
//                    backgroundColor: Colors.pink,
//                    primaryColor: Colors.pink,
//                    accentColor: Colors.pink),
//                child: SimpleDialog(
//                  title: Text("Title"),
//
//                  elevation: 18,
//                  backgroundColor: Colors.white,
//                  children: <Widget>[
//                    FlatButton(
//                      child: Text("cancel"),
//                      onPressed: () {
//                        Navigator.of(context).pop(false);
//
//                      },
//                    ),
//                    FlatButton(
//                      child: Text("confirm"),
//                      onPressed: () {
//
//                        Navigator.of(context).pop(true);
//
//                      },
//                    ),
//                  ],
//                ),
//              ));
//          print("resutl =${result}");

//          if (result == true) {
//            print("成功");
//          } else {
//            print("failed");
//          }

//          final result = await showModalBottomSheet<int>(
//            context: context,
//            builder: (BuildContext context) {
//              return ListView.builder(
//                itemCount: 30,
//                itemBuilder: (BuildContext context, int index) {
//                  return ListTile(
//                    title: Text("$index"),
//                    onTap: () => Navigator.of(context).pop(index),
//                  );
//                },
//              );
//            },
//          );
//          print("result = $result");
//        await _showBottomSheet();
          DateTime time = await _showDatePicker2();

          print("time = $time");
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<DateTime> _showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            minimumDate: date,
            backgroundColor: Colors.red,
            maximumDate: date.add(
              Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      },
    );
  }

  showLoadingDialog2() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Waiting"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                RaisedButton(
                  child: Text("dismiss"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  Future<DateTime> _showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        //未来30天可选
        Duration(days: 30),
      ),
    );
  }

  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 240,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  ),
                  RaisedButton(
                    child: Text("dismiss"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // 弹出底部菜单列表模态对话框
  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  Future<bool> showDeleteConfirmDialog4() {
    // 默认不选中
    bool _withTree = false;
    print("ischeck  =  buldl  $_withTree");

    return showDialog(
        context: context,
        builder: (context) {
          print(" show Dialog Builder ${context}");
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("是否选中"),
                Builder(
                  builder: (context) {
                    print("rebuild checkbox");

                    return Checkbox(
                      // 依然使用Checkbox组件
                      value: _withTree,
                      onChanged: (bool value) {
                        // 此时context为对话框UI的根Element，我们
                        // 直接将对话框UI对应的Element标记为dirty
                        (context as Element).markNeedsBuild();
                        _withTree = !_withTree;
                      },
                    );
                  },
                )

//              MyCheckbox(isCheck: isCheck, callback: (value) {
//                isCheck = value;
//              },)
              ],
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text("cancel"),
                onPressed: () {
                  Navigator.of(context).pop(_withTree ? false : null);
                },
              ),
              RaisedButton(
                child: Text("confirm"),
                onPressed: () {
                  Navigator.of(context).pop(_withTree);
                },
              )
            ],
          );
        });
  }

  // 返回的是一个controller
  PersistentBottomSheetController<int> _showBottomSheet() {
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                // do something
                print("$index");
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }

  Future<bool> showDeleteConfirmDialog3() {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  DialogCheckbox(
                    value: _withTree, //默认不选中
                    onChanged: (bool value) {
                      //更新选中状态
                      _withTree = !_withTree;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  bool withTree = false; // 复选框选中状态
  Future<bool> showDeleteConfirmDialog2() {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        print("builder dialog");

        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  Checkbox(
                    value: withTree,
                    onChanged: (bool value) {
                      //复选框选中状态发生变化时重新构建UI
                      setState(() {
                        //更新复选框状态
                        withTree = !withTree;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> showCustomDialog(WidgetBuilder builder) {
    ThemeData theme = Theme.of(context).copyWith(
      backgroundColor: Colors.black,
      accentColor: Colors.pink,
      primaryColor: Colors.pink,
    );

    return showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          final Widget pageChild = Builder(builder: builder);
          return SafeArea(
            child: builder(context),
          );
        },
        barrierDismissible: false,
        barrierColor: Colors.black87,
        transitionDuration: Duration(milliseconds: 240),
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return ScaleTransition(
            scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            child: child,
          );
        });
  }

  Future<bool> showDialogAsync(context) {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("dialog title"),
              content: Text("Contetn"),
              actions: <Widget>[
                FlatButton(
                  child: Text("取消"),
                  onPressed: () => Navigator.of(context).pop(), // 关闭对话框
                ),
                FlatButton(
                  child: Text("删除"),
                  onPressed: () {
                    //关闭对话框并返回true
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            ));
  }

  Future<void> changeLanguage() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
//                  Navigator.pop(context, 1);
                  Navigator.of(context).pop(1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.of(context).pop(2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog() async {
    int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  Future<void> showListDialog2() async {
    Widget child = SizedBox(
      width: 130,
      height: 110,
      child: Column(
        children: <Widget>[
//                  Text("请选择:"),

          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              );
            },
          ),

          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("index = $index"),
                );
              },
            ),
          ),
        ],
      ),
    );
    return showDialog(
        context: context,
        builder: (context) {
          return UnconstrainedBox(
            child: SizedBox(
              width: 200,
              height: 300,
              child: Material(
                child: child,
                type: MaterialType.card,
              ),
            ),
          );
        });
  }
}

// 单独封装一个内部管理选中状态的复选框组件
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    @required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        //将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          //更新自身选中状态
          value = v;
        });
      },
    );
  }
}

class GestureTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureTestRouteState();
  }
}

class GestureTestRouteState extends State<GestureTestRoute> {
  PointerMoveEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureTest"),
      ),
      body: Stack(
        children: <Widget>[
          Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event) => print("down"),
              ),
            ),
            onPointerDown: (event) => print("up"),
          )
        ],
      ),
    );
  }
}

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
          ),
          onTap: () {
            updateText("w34");
          },
        ),
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

class AnimationRoute extends StatefulWidget {
  @override
  AnimationState createState() => AnimationState();
}

class AnimationState extends State<AnimationRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addListener(() {
            print("value = ${_controller.value}");
            setState(() {});
          });
    _animation = Tween<double>(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    _animation = null;
  }

  @override
  Widget build(BuildContext context) {
    print("build AnimationState");

    return Scaffold(
        appBar: AppBar(
          title: Text("Animation ${_animation.value}"),
        ),
//      body: Center(
//        child: Container(
//          width: _animation.value,
//          height: _animation.value,
//          child: ClipOval(
//            child: Image.asset("test.png"),
//          ),
//        ),
//      ),

//        body: TweenAnimationBuilder(
//          child: Image.asset("test.png"),
//          tween: Tween<double>(begin: 0, end: 100),
//          builder: (BuildContext context, double value, Widget child) {
//            print("child = $child");
//
//            return Container(
//              height: value,
//              width: value,
//              child: child,
//            );
//          },
//          duration: Duration(seconds: 1),
//        )

        body: GrowTransition(
          child: Image.asset("test.png"),
          animation: _animation,
        ));
//        body: AnimatedBuilder(
//          child: Image.asset("test.png"),
//          animation: _animation,
//          builder: (BuildContext context, Widget child) {
//            print("animatedBuidler");
//
//            return Center(
//              child: Container(
//                width: _animation.value,
//                height: _animation.value,
//                child: child,
//              ),
//            );
//          },
//        ));
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    print("build GrowTransition");

    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            print("child $child");

            return new Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}

class RouteSwitchRoute extends StatefulWidget {
  @override
  RouteSwitchState createState() => RouteSwitchState();
}

class RouteSwitchState extends State<RouteSwitchRoute>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RouteSwitch"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("跳转B"),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (BuildContext context, Animation animation,
                          Animation secondaryAnimation) {
                        return FadeTransition(
                          child: BRoute(),
                          opacity: animation,
                        );
                      },
                      transitionDuration: Duration(milliseconds: 200)),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class BRoute extends StatefulWidget {
  @override
  BState createState() => BState();
}

class BState extends State<BRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("退回A"),
          onPressed: () {
            Navigator.pop(context, 23);
          },
        ),
      ),
    );
  }
}

// 路由A
class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Container(
        alignment: Alignment.bottomLeft,
        child: InkWell(
          child: Hero(
            tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
            child: ClipOval(
              child: Image.asset(
                "test.png",
                width: 50.0,
              ),
            ),
          ),
          onTap: () {
            //打开B路由
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
              return new FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("原图"),
                  ),
                  body: HeroAnimationRouteB(),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("test.png"),
      ),
    );
  }
}

class HeroRoute extends StatefulWidget {
  @override
  HeroState createState() => HeroState();
}

class HeroState extends State<HeroRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "test",
            child: ClipOval(
              child: Image.asset(
                "test.png",
                width: 50,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(seconds: 2),
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return FadeTransition(
                        opacity: animation,
                        child: HeroDetailRoute(),
                      );
                    }));
          },
        ),
      ),
    );
  }
}

class HeroDetailRoute extends StatefulWidget {
  @override
  HeroDetailState createState() => HeroDetailState();
}

class HeroDetailState extends State<HeroDetailRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeroDetail"),
      ),
      body: Center(
        child: Hero(
          child: Image.asset("test.png"),
          tag: "test",
        ),
      ),
    );
  }
}

class StaggerRoute extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            //调用我们定义的交织动画Widget
            child: StaggerAnimation(controller: _controller),
          ),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    //高度动画
    height = Tween<double>(
      begin: .0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: .0),
      end: EdgeInsets.only(left: 100.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1.0, //间隔，后40%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class JiaoZhiRoute extends StatefulWidget {
  @override
  JiaoZhiState createState() => JiaoZhiState();
}

class JiaoZhiState extends State<JiaoZhiRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  void _playAnimation() async {
    await _controller.forward().orCancel;
    await _controller.reverse().orCancel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JiaoZhi"),
      ),
      body: GestureDetector(
        onTap: () {
          _playAnimation();
        },
        behavior: HitTestBehavior.opaque,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red), color: Colors.grey),
            child: StaggerAnimationRoute(
              controller: _controller,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StaggerAnimationRoute extends StatelessWidget {
  StaggerAnimationRoute({Key key, this.controller}) : super(key: key) {
    color = Tween<Color>(begin: Colors.red, end: Colors.yellow).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.6, curve: Curves.easeIn)));
//    height = Tween<double>(begin: 0, end: 50).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.6, curve:Curves.easeIn)));
//    transX = Tween<double>(begin: 0, end: 50).animate(CurvedAnimation(parent: controller, curve: Interval(0.6, 1.0, curve:Curves.easeIn)));
    //高度动画
    height = Tween<double>(
      begin: .0,
      end: 50.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    color = ColorTween(begin: Colors.red, end: Colors.yellow).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0, 0.6, curve: Curves.easeIn)));

//    color = ColorTween(
//      begin: Colors.green,
//      end: Colors.red,
//    ).animate(
//      CurvedAnimation(
//        parent: controller,
//        curve: Interval(
//          0.0, 0.6, //间隔，前60%的动画时间
//          curve: Curves.ease,
//        ),
//      ),
//    );

    transX = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: .0),
      end: EdgeInsets.only(left: 100.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1.0, //间隔，后40%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
  }

  final Animation controller;

  Animation<Color> color;
  Animation<double> height;
  Animation<EdgeInsets> transX;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return UnconstrainedBox(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: transX.value,
            color: color.value,
            width: 50.0,
            height: height.value,
          ),
        );
      },
    );
  }
}

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("11111111"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                //执行缩放动画
//                return ScaleTransition(child: child, scale: animation);
                print("transitionBuilder");

                return MySlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                          .animate(animation),
                  child: child,
                );
              },
              child: Text(
                '$_count',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              child: const Text(
                '+1',
              ),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({Key key, @required Animation<Offset> position, this.child})
      : super(key: key, listenable: position);

  Animation<Offset> get position => listenable;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    print("MYSlideTransition ${position.status} ${-offset.dx}");
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: true,
      child: child,
    );
  }
}

class FractionalTranslationTestRoute extends StatefulWidget {
  @override
  FractionalTranslationTestState createState() =>
      FractionalTranslationTestState();
}

class FractionalTranslationTestState
    extends State<FractionalTranslationTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FractionalTranslationTest"),
      ),
      body: Container(
        width: 200,
        height: 200,
        color: Colors.red,
        child: Center(
          child: FractionalTranslation(
            child: Text(
              "nihao",
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                backgroundColor: Colors.yellow,
              ),
            ),
            translation: Offset(2, 1),
          ),
        ),
      ),
    );
  }
}

class AnimatedDecoratedBox1 extends StatefulWidget {
  AnimatedDecoratedBox1({
    Key key,
    @required this.decoration,
    this.child,
    this.curve = Curves.linear,
    @required this.duration,
    this.reverseDuration,
  });

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
    with SingleTickerProviderStateMixin {
  @protected
  AnimationController get controller => _controller;
  AnimationController _controller;

  Animation<double> get animation => _animation;
  Animation<double> _animation;

  DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    print("guodu build");

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null)
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    else
      _animation = _controller;
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) _updateCurve();
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;
      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class GuoduRoute extends StatefulWidget {
  @override
  GuoduState createState() => GuoduState();
}

class GuoduState extends State<GuoduRoute> {
  @override
  Widget build(BuildContext context) {
    Color _decorationColor = Colors.blue;
    var duration = Duration(seconds: 1);
    print("build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Guodu"),
      ),
      body: Center(
        child: AnimatedDecoratedBox1(
          duration: duration,
          decoration: BoxDecoration(color: _decorationColor),
          child: FlatButton(
            onPressed: () {
              setState(() {
                _decorationColor = Colors.red;
              });
            },
            child: Text(
              "AnimatedDecoratedBox",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedWidgetsTest extends StatefulWidget {
  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;
  double _borderWidth = 1;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 1);
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _padding = 20;
                });
              },
              child: AnimatedPadding(
                duration: duration,
                padding: EdgeInsets.all(_padding),
                child: Text("AnimatedPadding"),
              ),
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: duration,
                    left: _left,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _left = 100;
                        });
                      },
                      child: Text("AnimatedPositioned"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey,
              child: AnimatedAlign(
                duration: duration,
                alignment: _align,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _align = Alignment.center;
                    });
                  },
                  child: Text("AnimatedAlign"),
                ),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              height: _height,
              color: _color,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _height = 250;
                    _color = Colors.blue;
                  });
                },
                child: Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedDefaultTextStyle(
              child: GestureDetector(
                child: Text("hello world"),
                onTap: () {
                  setState(() {
                    _style = TextStyle(
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue,
                    );
                  });
                },
              ),
              style: _style,
              duration: duration,
            ),
            AnimatedDecoratedBox1(
              duration: duration,
              decoration: BoxDecoration(
                  color: _decorationColor,
                  border:
                      Border.all(width: _borderWidth, color: Colors.yellow)),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _decorationColor = Colors.red;
                    _borderWidth = 100;
                  });
                },
                child: Text(
                  "AnimatedDecoratedBox",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
//            AnimatedPadding(
//              padding: EdgeInsets.only(top: _paddingTop), duration: Duration(seconds: 1),
//              child: Ra,
//            )
          ].map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }

  double _paddingTop = 10;
}

class CombineRoute extends StatefulWidget {
  @override
  CombineState createState() => CombineState();
}

class CombineState extends State<CombineRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Combine"),
      ),
      body: Column(
        children: <Widget>[
          GradiantButtonRoute(
            onPressed: () {
              print("GradientButton Click");
            },
            colors: <Color>[Colors.red, Colors.yellow],
            text: "我是GradientButton",
            width: double.infinity,
            borderRadius: BorderRadius.circular(10),
          )
        ]
            .map((widget) => Padding(
                  padding: EdgeInsets.all(10),
                  child: widget,
                ))
            .toList(),
      ),
    );
  }
}

class GradiantButtonRoute extends StatefulWidget {
  GradiantButtonRoute({
    @required this.colors,
    this.borderRadius,
    @required this.onPressed,
    this.width = 100,
    this.height = 100,
    @required this.text,
  });

  List<Color> colors;
  BorderRadius borderRadius;
  GestureTapCallback onPressed;
  double width;
  double height;
  String text;

  @override
  GradiantButtonState createState() => GradiantButtonState();
}

class GradiantButtonState extends State<GradiantButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          highlightColor: Colors.transparent,
          borderRadius: widget.borderRadius,
          child: ConstrainedBox(
            constraints:
                BoxConstraints.tight(Size(widget.width, widget.height)),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(widget.text),
              ),
            ),
          ),
          onTap: widget.onPressed,
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.colors,
          ),
          borderRadius: widget.borderRadius),
    );
  }
}

class TurnBox extends StatefulWidget {
  const TurnBox(
      {Key key,
      this.turns = .0, //旋转的“圈”数,一圈为360度，如0.25圈即90度
      this.speed = 200, //过渡动画执行的总时长
      this.child})
      : super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  _TurnBoxState createState() => new _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //旋转角度发生变化时执行过渡动画
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed ?? 200),
        curve: Curves.bounceInOut,
      );
    }
  }
}

class TurnBoxRoute extends StatefulWidget {
  @override
  _TurnBoxRouteState createState() => new _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Turn"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TurnBox(
                turns: _turns,
                speed: 500,
                child: Icon(
                  Icons.refresh,
                  size: 50,
                ),
              ),
              TurnBox(
                turns: _turns,
                speed: 1000,
                child: Icon(
                  Icons.refresh,
                  size: 150.0,
                ),
              ),
              RaisedButton(
                child: Text("顺时针旋转1/5圈"),
                onPressed: () {
                  setState(() {
                    _turns += .2;
                  });
                },
              ),
              RaisedButton(
                child: Text("逆时针旋转1/5圈"),
                onPressed: () {
                  setState(() {
                    _turns -= .2;
                  });
                },
              )
            ],
          ),
        ));
  }
}

class TurnRoute extends StatefulWidget {
  @override
  TurnState createState() => TurnState();
}

class TurnState extends State<TurnRoute> {
  double _turns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Turn"),
      ),
      body: Column(
        children: <Widget>[
          TurnIcon(
            turns: _turns,
            child: Icon(
              Icons.refresh,
              size: 30,
            ),
          ),
          RaisedButton(
            child: Center(
              child: Text("改变角度"),
            ),
            onPressed: () {
              setState(() {
                _turns += .2;
              });
            },
          )
        ],
      ),
    );
  }
}

class TurnIcon extends StatefulWidget {
  TurnIcon({
    Key key,
    this.speed,
    this.child,
    this.turns,
  }) : super(key: key);

  double speed;

  Widget child;
  double turns;

  @override
  TurnIconState createState() => TurnIconState();
}

class TurnIconState extends State<TurnIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      child: widget.child,
      turns: _controller,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(TurnIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(seconds: 1),
      );
    }
  }
}

class CustomPaintRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomPaintRouteState();
  }
}

class CustomPaintRouteState extends State<CustomPaintRoute> {
  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(title: Text("五子棋")),
      body: Center(
        child: GestureDetector(
          onTapUp: (TapUpDetails upDetails) {
            print(upDetails.localPosition);
            setState(() {});
          },
          child: CustomPaint(
            size: Size(400, 400), //指定画布大小
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({this.list});

  List<int> list;

  @override
  void paint(Canvas canvas, Size size) {
    print("paint");
    list ??= [];
    list?.add(111);
    print(list.length);

    double eWidth = size.width / 20;
    double eHeight = size.height / 20;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0x77cdb175); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 20; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 20; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(eWidth * 10, eHeight * 10),
      min(eWidth / 2, eHeight / 2),
      paint,
    );

    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(eWidth * 11, eHeight * 11),
      min(eWidth / 2, eHeight / 2),
      paint,
    );
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class GradientCircularProgressRoute extends StatefulWidget {
  @override
  GradientCircularProgressRouteState createState() {
    return new GradientCircularProgressRouteState();
  }
}

class GradientCircularProgressRouteState
    extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.addListener(() {
      print("value = ${_animationController.value}");
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("11")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context, Widget child) {
                  print("animatedbuilder");

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: <Widget>[
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 16.0,
                          children: <Widget>[
                            GradientCircularProgressIndicator(
                              // No gradient
                              colors: [Colors.blue, Colors.blue],
                              radius: 50.0,
                              strokeWidth: 3.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange],
                              radius: 50.0,
                              strokeWidth: 3.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange, Colors.red],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.teal, Colors.cyan],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              strokeCapRound: true,
                              value: CurvedAnimation(
                                      parent: _animationController,
                                      curve: Curves.bounceOut)
                                  .value,
                            ),
                            TurnBox(
                              turns: 1 / 8,
                              child: GradientCircularProgressIndicator(
                                  colors: [
                                    Colors.red,
                                    Colors.orange,
                                    Colors.red
                                  ],
                                  radius: 50.0,
                                  strokeWidth: 5.0,
                                  strokeCapRound: true,
                                  backgroundColor: Colors.red[50],
                                  totalAngle: 1.5 * pi,
                                  value: CurvedAnimation(
                                          parent: _animationController,
                                          curve: Curves.ease)
                                      .value),
                            ),
                            RotatedBox(
                              quarterTurns: 0,
                              child: GradientCircularProgressIndicator(
                                  colors: [Colors.blue[700], Colors.blue[200]],
                                  radius: 150.0,
                                  strokeWidth: 13.0,
                                  strokeCapRound: true,
                                  backgroundColor: Colors.red[50],
                                  value: _animationController.value),
                            ),
                            GradientCircularProgressIndicator(
                              colors: [
                                Colors.red,
                                Colors.amber,
                                Colors.cyan,
                                Colors.green[200],
                                Colors.blue,
                                Colors.red
                              ],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              strokeCapRound: true,
                              value: _animationController.value,
                            ),
                          ],
                        ),
                        GradientCircularProgressIndicator(
                          colors: [Colors.blue[700], Colors.blue[200]],
                          radius: 100.0,
                          strokeWidth: 20.0,
                          value: _animationController.value,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: GradientCircularProgressIndicator(
                            colors: [Colors.blue[700], Colors.blue[300]],
                            radius: 100.0,
                            strokeWidth: 20.0,
                            value: _animationController.value,
                            strokeCapRound: true,
                          ),
                        ),
                        //剪裁半圆
                        ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,
                            heightFactor: .5,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SizedBox(
                                //width: 100.0,
                                child: TurnBox(
                                  turns: .75,
                                  child: GradientCircularProgressIndicator(
                                    colors: [Colors.teal, Colors.cyan[500]],
                                    radius: 100.0,
                                    strokeWidth: 8.0,
                                    value: _animationController.value,
                                    totalAngle: pi,
                                    strokeCapRound: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 104.0,
                          width: 200.0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Positioned(
                                height: 200.0,
                                top: .0,
                                child: TurnBox(
                                  turns: .75,
                                  child: GradientCircularProgressIndicator(
                                    colors: [Colors.teal, Colors.cyan[500]],
                                    radius: 100.0,
                                    strokeWidth: 8.0,
                                    value: _animationController.value,
                                    totalAngle: pi,
                                    strokeCapRound: true,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "${(_animationController.value * 100).toInt()}%",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  GradientCircularProgressIndicator(
      {this.strokeWidth = 2.0,
      @required this.radius,
      @required this.colors,
      this.stops,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.totalAngle = 2 * pi,
      this.value});

  ///粗细
  final double strokeWidth;

  /// 圆的半径
  final double radius;

  ///两端是否为圆角
  final bool strokeCapRound;

  /// 当前进度，取值范围 [0.0-1.0]
  final double value;

  /// 进度条背景色
  final Color backgroundColor;

  /// 进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;

  /// 渐变色数组
  final List<Color> colors;

  /// 渐变色的终止点，对应colors属性
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    // 下面调整的角度的计算公式是通过数学几何知识得出，读者有兴趣可以研究一下为什么是这样
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }

    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
          size: Size.fromRadius(radius),
          painter: _GradientCircularProgressPainter(
            strokeWidth: strokeWidth,
            strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius,
            colors: _colors,
          )),
    );
  }
}

//实现画笔
class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter(
      {this.strokeWidth: 10.0,
      this.strokeCapRound: false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.radius,
      this.total = 2 * pi,
      @required this.colors,
      this.stops,
      this.value});

  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = strokeWidth / 2.0;
    double _value = (value ?? .0);

    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    // 先画背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      print("drawArc $rect");

//      canvas.drawArc(rect, _start, total, false, paint);
    }

    // 再画前景，应用渐变
//    if (_value > 0) {
//      paint.shader = SweepGradient(
//        startAngle: 0.0,
//        endAngle: _value,
//        colors: colors,
//        stops: stops,
//      ).createShader(rect);
//
//      canvas.drawArc(rect, _start, _value, false, paint);
//
////      canvas.drawOval(Rect.fromCenter(
////        width: 150, height: 50
////      ), paint);
//    }

    paint.strokeWidth = 5;
    canvas.drawArc(
        Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100),
        0,
        pi * 2,
        false,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TranformRotateRoute extends StatefulWidget {
  @override
  TranformRotateState createState() => TranformRotateState();
}

class TranformRotateState extends State<TranformRotateRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
            print(_controller.value);
            setState(() {});
          });

    Future.delayed(Duration(seconds: 1), () {
      print("kaishi");
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("buid");

    return Scaffold(
      appBar: AppBar(
        title: Text("TranformRotate"),
      ),
      body: Center(
        child: Transform.rotate(
          angle: pi * 2 * _controller.value,
          child: Text("1111"),
        ),
      ),
    );
  }
}

class CustomPainterRoute extends StatefulWidget {
  @override
  CustomPainterState createState() => CustomPainterState();
}

class CustomPainterState extends State<CustomPainterRoute> {
  var iv;
  var ivWidth;
  var ivHeight;

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void initState() {
    super.initState();
    test();
  }

  test() async {
    (await getCodec("assets/test.png")).getNextFrame().then((info) {

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          ivWidth = info.image.width;
          ivHeight = info.image.height;
          iv = info.image;
        });
      });
    });
  }

  Future<Codec> getCodec(String path) async {
    ByteData data = await rootBundle.load("$path");
    print("data = $data");
    var codec = await instantiateImageCodec(data.buffer.asUint8List());
    return codec;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomPainter"),
      ),
      body: Center(
        child: Container(
          color: Colors.pink[100],
          child: SizedBox(
            width: 300,
            height: 300,
//            child: CustomPaint(
//              size: Size(300, 300),
//              painter: MyPaint(iv, ivWidth, ivHeight),
//            ),
            child: CustomHome()
          ),
        ),
      ),
    );
  }
}

class MyPaint extends CustomPainter {
  MyPaint(this.iv, this.ivWidth, this.ivHeight);

  var iv;
  var ivWidth;
  var ivHeight;

  @override
  void paint(Canvas canvas, Size size) async {
    final paint = Paint()
      ..strokeWidth = 40
      ..isAntiAlias = true
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
//    canvas.drawCircle(Offset(50, 50), 50, paint);
//    canvas.drawColor(Colors.red, BlendMode.color);

//    canvas.drawOval(Rect.fromLTRB(0, 0, 200, 200), paint);

//      canvas.drawArc(Rect.fromLTRB(0, 0, 200, 200), 0, pi * 3 / 2, false, paint);

    if (iv != null && ivWidth != null && ivHeight != null) {
      print("ivWidth = $ivWidth ivHeight = $ivHeight");

      canvas.drawImage(
          iv,
          Offset((size.width - ivWidth) / 2, (size.height - ivHeight) / 2),
          paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CustomHome extends Widget {
  @override
  Element createElement() {
    return HomeView(this);
  }

}

class HomeView extends ComponentElement {

  var text = "123456789";

  HomeView(Widget widget) : super(widget);

  @override
  Widget build() {
    new Test().test();
    return GestureDetector(

      child: Center(
        child: FlatButton(
          child: Column(
            children: <Widget>[
              Text(text, style: TextStyle(color: Theme.of(this).primaryColor),),
              CustomPaint(
                child: RepaintBoundary(),
                painter: MyPainter(),
              )
            ],
          ),
          onPressed: () {
            text = (text.split("")..shuffle()).join();
            markNeedsBuild();

          },
        ),
      ),
    );
  }

}


