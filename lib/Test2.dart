
void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

void main() {
  Function x;

  // Comparing top-level functions.
  x = foo;
  assert(foo == x);

  // Comparing static methods.
  x = A.bar;
  assert(A.bar == x);

  // Comparing instance methods.
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  // These closures refer to the same instance (#2),
  // so they're equal.
  assert(y.baz == x);

  // These closures refer to different instances,
  // so they're unequal.
  assert(v.baz != w.baz);

  foo1() {}

  assert(foo1() == null);

  int a;
  int b;

  a = 0;
  b = ++a; // Increment a before b gets its value.
  assert(a == b); // 1 == 1

  a = 0;
  b = (a++); // Increment a AFTER b gets its value.
  assert(a != b); // 1 != 0

  a = 0;
  b = --a; // Decrement a before b gets its value.
  assert(a == b); // -1 == -1

  a = 0;
  b = a--; // Decrement a AFTER b gets its value.
  assert(a != b); // -1 != 0

  var callbacks = [];
  for (var i = 0; i < 5; i++) {
    callbacks.add(() => print('Gia tri: $i'));
  }
  callbacks.forEach((c) => c());

  List<Color> colors = Color.values;
  assert(colors[1] == Color.green);


  Future<String> lookUpVersion() async => '1.0.0';

  print(lookUpVersion());

  print(out);

  // typedef IntList = List<int>;
  // IntList il = [1, 2, 3];

}

class WannabeFunction {
  String call(String a, String b, String c, String d) => '$a $b $c!';
}

var wf = WannabeFunction();
var out = wf('Hi', 'there,', 'gang', '');


enum Color { red, green, blue }

