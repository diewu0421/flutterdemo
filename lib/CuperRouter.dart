import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuperRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CuperState();
}

class CuperState extends State<CuperRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino Demo"),
      ),
      body: Column(
        children: <Widget>[
          CupertinoButton(
            child: Text("Press"),
            color: CupertinoColors.activeBlue,
            onPressed: () {
              print("asdfasdf");
            },
          ),
          Text(
            "Hello World" * 20,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 2.0,
//              textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active1111111' : 'Inac1111111tive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    print("handle down");

    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    print("handle up");

    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    print("HandleTapCancel");

    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    print("handltap");

//    widget.onChanged(!widget.active);
    setState(() {
      widget.active = !widget.active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown,
      // 处理按下事件
      onTapUp: _handleTapUp,
      // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}

class ScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appbar"),
      ),
      body: CupertinoScrollbar(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("index=$index"),
              );
            }),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({this.data, Widget child}) : super(child: child);

  DataClass data;

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    print("是否应该通知 ${oldWidget.data != data}");

    return oldWidget.data != data;
  }
}

class TestInheritedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestInheritedWidgetState();
  }
}

class TestInheritedWidgetState extends State<TestInheritedWidget> {
  @override
  Widget build(BuildContext context) {
    print("重新");

    return Container(
      color: ShareDataWidget.of(context).data.backgroundColor,
      child: Text(ShareDataWidget.of(context).data.count.toString()),
    ) ;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didchangedependencies");
  }
}

class TestInheriteRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestInheriteRouteState();
  }
}

class DataClass {
  Color backgroundColor;
  int count;

  DataClass({this.backgroundColor, this.count});
}

class TestInheriteRouteState extends State<TestInheriteRoute> {
  DataClass count;

  @override
  void initState() {
    super.initState();
    count = DataClass(count: 23, backgroundColor: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试inherit"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ShareDataWidget(
              data: count,
              child: TestInheritedWidget(),
            ),
            IconButton(
              icon: Icon(Icons.check_box),
              onPressed: () {
                setState(() {
//                  count += 1;
                  count.count += 1;
                  count.backgroundColor = Colors.yellow;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
