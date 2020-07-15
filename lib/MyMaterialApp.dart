import 'package:flutter/material.dart';

class MyMaterialApp extends MaterialApp {

   MyMaterialApp() : super(
    title: "review flutter",
    theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS),
     home: NewHomeRoute()
  );

}


class NewHomeRoute extends StatefulWidget {
  @override
  NewHomeState createState() => NewHomeState();
}

class NewHomeState extends State<NewHomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NewHome"),),
      body: Center(
        child: Column(
          children: <Widget>[
            Builder(
              builder: (context) {

                return RaisedButton(
                  child: Text("我是按钮"),
                  onPressed: () {
//                    Scaffold.of(context).showSnackBar(
//                        SnackBar(
//                            content: Text("asdfasf"),
//                          action: SnackBarAction(
//                            textColor: Colors.red, label: "我是label",
//                            onPressed: () {
//                              print("press snackbarAction");
//                            },
//                          ),
//
//                        )
//                    );

                  Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ActivityBRoute();
                  }

                  ));

                  },
                );
              },
            )

          ],
        ),
      ),
    );
  }
}


class ActivityBRoute extends StatefulWidget {
  @override
  ActivityBState createState() => ActivityBState();
}

class ActivityBState extends State<ActivityBRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ActivityB"),),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("返回上一个页面"),
              onPressed: () {
                Navigator.pop(context, "我是返回值");
              },
            )
          ],
        ),
      ),
    );
  }
}
