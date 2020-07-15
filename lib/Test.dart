class Test {
  int value = 1;

//  Test(int value) {
//    this.value = value;
//  }

  void test() {
//    int s = 6;
//    setValue(s);
//
//    print("s = $s");

//    Test a = new Test();
//    a.value = 10;
//    print("before a.value = ${a.value}");
//
//    setValue(a);
//
//    print("after a.value = ${a.value}");

//    int ii = 10;
//    var b = ii;
//    set_i(ii);
//
//    print(identical(ii, b));
//    b = 1123;
//    print("after ${identical(ii, b)}");
//
//    print("ii = $ii b = $b");
//
//
//
//    print("ii = $ii");
//
//
//    A aa = A();
//    print("old: A.idnex=${aa.index}");
//    setv_A(aa);
//    print("new: A.index=${aa.index}");
//
//
//    {
//      var a = ['Apple', 'Orange'];
//
//      var b = a;
//      a = ['Banna'];
//
//      print(a);
//      print(b);
//    }
//    {
//      var a = ['Apple', 'Orange'];
//      var b = a;
//      a.clear();
//      a.add("bannana");
//      print("*********8");
//
//
//      print(a);
//      print(b);
//    }

//    var t = 100;
//    t  = 100;
//    t = "Hellow";

    const a = 10;

//    const b = a * 10;
    final name = "hello";


    var bar = 1.04;


    var foo = [];
//    foo.add(234);

//    foo = const [1,2,3];
    foo = [];

    print(foo);

    test12(isBole);


    var say = (msg) {
      print("msg = $msg");
    };


    say("helloeaf");
    print("__________________________-");

//
//    Future.wait([
//
//      Future.delayed(Duration(seconds: 1), () {
//        return "Hello";
//
//
//      }),
//      Future.delayed(Duration(seconds: 2), () {
//        return " World";
//
//      })
//    ])
//        .then((result) {
//
//      print("result = $result");
//
//    });



//    Future.delayed(Duration(seconds: 1), () {
//      return Future.delayed(Duration(seconds: 1), () {
//        print("ebembed");
//        return "11111";
//      });
//    })
//    .then((result) {
//      print("result = $result");
//    });

  task();

  }
}
task() async {
  print("I'm a task0");
  print(await getUserInfo());

}
Future<String> getUserInfo() async {
  return "Niasdfasf";

}

int testasdfasf() => 23;


bool isBole(int a) {
  return a != 0;
}

void test12(CALLBACK cb) {
  print(cb(3));
}

typedef bool CALLBACK(int a);

setValue(int s) {
//  print("setValue = ${s.isNaN}");
  s = 10;

//  s += 1;
//  s.value = 24234;
}

class A {
  int index = 0;
}

void set_i(int a) {
  a += 1;
}

void setv_A(A a) {
  a.index += 1;
}
