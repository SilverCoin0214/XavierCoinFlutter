import "dart:collection";
import "dart:math";

/// Welcome to Learn Dart in 15 minutes. http://dart.dev/
/// This is an executable tutorial. You can run it with Dart or on
/// the Try Dart! site if you copy/paste it there. http://dartpad.dev/
/// You can also run Flutter in DartPad by click the `< > New Pad ` and choose Flutter

/// In Dart, Everything is an Object.
/// Every declaration of an object is an instance of Null and
/// Null is also an object.

/// 3 Types of comments in dart
// Single line comment
/**
* Multi-line comment
* Can comment more than 2 lines
*/
/// Code doc comment
/// It uses markdown syntax to generate code docs when making an API.
/// Code doc comment is the recommended choice when documenting your APIs, classes and methods.

/// 4 types of variable declaration.
/// Constants are variables that are immutable cannot be change or altered.
/// `const` in dart should practice SCREAMING_SNAKE_CASE name declaration.
const CONSTANT_VALUE = "I CANNOT CHANGE";

/// Final is another variable declaration that cannot be change once it has been instantiated. Commonly used in classes and functions
/// `final` can be declared in pascalCase.
final finalValue = "value cannot be change once instantiated";

/// `var` is another variable declaration that is mutable and can change its value. Dart will infer types and will not change its data type
var mutableValue = "Variable string";

/// `dynamic` is another variable declaration in which the type is not evaluated by the dart static type checking.
/// It can change its value and data type.
/// Some dartisans uses dynamic cautiously as it cannot keep track of its data type. so use it at your own risk
dynamic dynamicValue = "I'm a string";

/// Functions can be declared in a global space
/// Function declaration and method declaration look the same. Function
/// declarations can be nested. The declaration takes the form of
/// name() {} or name() => singleLineExpression;
/// The fat arrow function declaration can be an implicit or
/// explicit return for the result of the expression.
/// Dart will execute a function called `main()` anywhere in the dart project.
///
example1() {
  nested1() {
    nested2() => print("Example1 nested 1 nested 2");
    nested2();
  }

  nested1();
}

/// Anonymous functions don't include a name but can take number of arguments
example2() {
  //// Explicit return type.
  nested1(Function fn) {
    fn();
  }

  nested1(() => print("Example2 nested 1"));
}

/// When a function parameter is declared, the declaration can include the
/// number of parameters the function takes by explicitly specifying the names of the
/// parameters it takes.
example3() {
  planA(fn(String informSomething)) {
    fn("Example3 plan A");
  }

  planB(fn) {
    // Or don't declare number of parameters.
    fn("Example3 plan B");
  }

  planA((s) => print(s));
  planB((s) => print(s));
}

/// Functions have closure access to outer variables.
/// Dart will infer types when the variable has a value of something.
/// In this example dart knows that this variable is a String.
var example4Something = "Example4 nested 1";
example4() {
  nested1(fn(informSomething)) {
    fn(example4Something);
  }

  nested1((s) => print(s));
}

/// Class declaration with a sayIt method, which also has closure access
/// to the outer variable as though it were a function as seen before.
var example5method = "Example5 sayIt";

class Example5Class {
  sayIt() {
    print(example5method);
  }
}

example5() {
  /// Create an anonymous instance of the Example5Class and call the sayIt
  /// method on it.
  /// the `new` keyword is optional in Dart.
  new Example5Class().sayIt();
}

/// Class declaration takes the form of class name { [classBody] }.
/// Where classBody can include instance methods and variables, but also
/// class methods and variables.
class Example6Class {
  var instanceVariable = "Example6 instance variable";
  sayIt() {
    print(instanceVariable);
  }
}

example6() {
  Example6Class().sayIt();
}

/// Class methods and variables are declared with "static" terms.
class Example7Class {
  static var classVariable = "Example7 class variable";
  static sayItFromClass() {
    print(classVariable);
  }

  sayItFromInstance() {
    print(classVariable);
  }
}

example7() {
  Example7Class.sayItFromClass();
  new Example7Class().sayItFromInstance();
}

/// Dart supports Generics.
/// Generics refers to the technique of writing the code for a class
/// without specifying the data type(s) that the class works on.
/// Source: https://stackoverflow.com/questions/4560890/what-are-generics-in-c

/// Type `T` refers to any type that has been instantiated
/// you can call whatever you want
/// Programmers uses the convention in the following
/// T - Type(used for class and primitype types)
/// E - Element(used for List, Set, or Iterable)
/// K,V - Key Value(used for Map)
class GenericExample<T> {
  void printType() {
    print("$T");
  }

  // methods can also have generics
  genericMethod<M>() {
    print("class:$T, method: $M");
  }
}

/// List are similar to arrays but list is a child of Iterable<E>
/// Therefore Maps, List, LinkedList are all child of Iterable<E> to be able to loop using the keyword `for`
/// Important things to remember:
/// () - Iterable<E>
/// [] - List<E>
/// {} - Map<K,V>

/// List are great, but there's a restriction for what List can be
/// outside of function/method bodies. List on the outer scope of class
/// or outside of class have to be constant. Strings and numbers are constant
/// by default. But arrays and maps are not. They can be made constant by
/// declaring them "const". Kind of similar to Javascript's Object.freeze()
const example8List = ["Example8 const array"];
const example8Map = {"someKey": "Example8 const map"};

/// Declare List or Maps as Objects.
List explicitList = [];
Map<String, dynamic> explicitMaps = new Map<String, dynamic>();

example8() {
  explicitList.add("SomeArray");
  print(example8Map["someKey"]);
  print(explicitList[0]);
}

var iterableExplicitList = explicitList;
var newExplicitLists = explicitList.toList(); // Converts Iterable<E> to List<E>

/// Loops in Dart take the form of standard for () {} or while () {} loops,
/// slightly more modern for (.. in ..) {}, or functional callbacks with many
/// supported features, starting with forEach,map and where.
var example9Array = const ["a", "b"];
example9() {
  print(iterableExplicitList); // ("SomeArray"); "[]" becomes "()"

  for (int i = 0; i < example9Array.length; i++) {
    print("Example9 for loop '${example9Array[i]}'");
  }
  var i = 0;
  while (i < example9Array.length) {
    print("Example9 while loop '${example9Array[i]}'");
    i++;
  }
  for (final e in example9Array) {
    print("Example9 for-in loop '${e}'");
  }

  example9Array.forEach((e) => print("Example9 forEach loop '${e}'"));
}

var example10String = "ab";
example10() {
  for (var i = 0; i < example10String.length; i++) {
    print("Example10 String character loop '${example10String[i]}'");
  }
  for (var i = 0; i < example10String.length; i++) {
    print("Example10 substring loop '${example10String.substring(i, i + 1)}'");
  }
}

/// `int`, `double`  and `num` are the three supported number formats.
/// `num` can be either `int` or `double`.
/// `int` and `double` are children of type `num`
example11() {
  var i = 1 + 320, d = 3.2 + 0.01;
  num myNumDouble = 2.2;
  num myNumInt = 2;
  int myInt = 1;
  double myDouble = 0; // Dart will add decimal prefix, becomes 0.0;
  myNumDouble = myInt; // valid
  myNumDouble = myDouble; //valid
  myNumDouble = myNumInt; //valid

  myNumInt = myInt; // valid
  myNumInt = myDouble; // valid
  myNumInt = myNumDouble; // valid

  print("Example11 int ${i}");
  print("Example11 double ${d}");
}

/// DateTime provides date/time arithmetic.
example12() {
  var now = new DateTime.now();
  print("Example12 now '${now}'");
  now = now.add(new Duration(
      days: 2,
      hours: 2,
      minutes: 2,
      seconds: 2,
      milliseconds: 2,
      microseconds: 2));
  print("Example12 tomorrow '${now}'");
}

/// Regular expressions are supported.
example13() {
  var s1 = "some string", s2 = "some", re = new RegExp("^s.+?g\$");
  match(s) {
    if (re.hasMatch(s)) {
      print("Example13 regexp matches '${s}'");
    } else {
      print("Example13 regexp doesn't match '${s}'");
    }
  }

  match(s1);
  match(s2);
}

example14() {
  var a;
  try {
    if (null == a) {
      print("a is null");
    }
  } catch (e) {
    print("catch a error:" + e.toString());
  }
  print(a?.name);
}

example15() {
  try {
    try {
      throw "Some unexpected error.";
    } catch (e) {
      print("Example15 an exception: '${e}'");
      throw e;

      /// Re-throw
    }
  } catch (e) {
    print("Example15 catch exception being re-thrown: '${e}'");
  } finally {
    print("Example15 Still run finally");
  }
}

example16() {
  var sb = new StringBuffer(), a = ["a", "b", "c", "d"], e;
  for (e in a) {
    sb.write(e);
  }
  print("Example16 dynamic string created with "
      "StringBuffer '${sb.toString()}'");
  print("Example16 join string array '${a.join()}'");
}

example17() {
  print("Example17 "
      "concatenate "
      "strings "
      "just like that");
}

example18() {
  print('Example18 <a href="etc">'
      "Don't can't I'm Etc"
      '</a>');
}

example19() {
  print('''Example19 <a href="etc">
Example19 Don't can't I'm Etc
Example19 </a>''');
}

example20() {
  var s1 = "'\${s}'", s2 = "'\$s'";
  print("Example20 \$ interpolation ${s1} or $s2 works.");
}

class Example21 {
  List<String> _names = [];

  Example21() {
    _names = ["a", "b"];
  }

  List<String> get names => _names;
  set names(List<String> list) {
    _names = list;
  }

  int get length => _names.length;
  void add(String name) {
    _names.add(name);
  }

  String toString() => "example21:" + _names.toString();
}

void example21() {
  Example21 o = new Example21();
  o.add("c");
  print("Example21 names '${o.names}' and length '${o.length}'");
  o.names = ["d", "e"];
  print("Example21 names '${o.names}' and length '${o.length}'");
  print(o.toString());
}

class Example22A {
  var _name = "Some Name!";
  get name => _name;
}

class Example22B extends Example22A {}

example22() {
  var o = new Example22B();
  print("Example22 class inheritance '${o.name}'");
}

class Example23A {}

class Example23Utils {
  addTwo(n1, n2) {
    return n1 + n2;
  }
}

class Example23B extends Example23A with Example23Utils {
  addThree(n1, n2, n3) {
    return addTwo(n1, n2) + n3;
  }
}

example23() {
  var o = new Example23B(), r1 = o.addThree(1, 2, 3), r2 = o.addTwo(1, 2);
  print("Example23 addThree(1, 2, 3) results in '${r1}'");
  print("Example23 addTwo(1, 2) results in '${r2}'");
}

class Example24A {
  var _value;
  Example24A({value: "someValue"}) {
    _value = value;
  }
  get value => _value;
}

class Example24B extends Example24A {
  Example24B({value: "someOtherValue"}) : super(value: value);
}

example24() {
  var o1 = new Example24B(), o2 = new Example24B(value: "evenMore");
  print("Example24 calling super during constructor '${o1.value}'");
  print("Example24 calling super during constructor '${o2.value}'");
}

class Example25 {
  var value, anotherValue;
  Example25({this.value, this.anotherValue});
}

example25() {
  var o = new Example25(value: "a", anotherValue: "b");
  print("Example25 shortcut for constructor '${o.value}' and "
      "'${o.anotherValue}'");
}

example26() {
  var _name, _surname, _email;
  setConfig1({name, surname}) {
    _name = name;
    _surname = surname;
  }

  setConfig2(name, [surname, email]) {
    _name = name;
    _surname = surname;
    _email = email;
  }

  setConfig1(surname: "Doe", name: "John");
  print("Example26 name '${_name}', surname '${_surname}', "
      "email '${_email}'");
  setConfig2("Mary", "Jane");
  print("Example26 name '${_name}', surname '${_surname}', "
      "email '${_email}'");
}

class Example27 {
  final color1, color2;

  /// A little flexibility to set final instance variables with syntax
  /// that follows the :
  Example27({this.color1, color2}) : color2 = color2;
}

example27() {
  final color = "orange", o = new Example27(color1: "lilac", color2: "white");
  print("Example27 color is '${color}'");
  print("Example27 color is '${o.color1}' and '${o.color2}'");
}

class Example28 extends IterableBase {
  var names;
  Example28() {
    names = ["a", "b"];
  }
  get iterator => names.iterator;
}

example28() {
  var o = new Example28();
  o.forEach((name) => print("Example28 '${name}'"));
}

example29() {
  var v = true ? 30 : 60;
  switch (v) {
    case 30:
      print("Example29 switch statement");
      break;
  }
  if (v < 30) {
  } else if (v > 30) {
  } else {
    print("Example29 if-else statement");
  }
  callItForMe(fn()) {
    return fn();
  }

  rand() {
    v = new Random().nextInt(50);
    return v;
  }

  while (true) {
    print("Example29 callItForMe(rand) '${callItForMe(rand)}'");
    if (v != 30) {
      break;
    } else {
      continue;
    }

    /// Never gets here.
  }
}

example30() {
  var gn,
      tooHigh = false,
      n,
      n2 = (2.0).toInt(),
      top = int.parse("123") ~/ n2,
      bottom = 0;
  top = top ~/ 6;
  gn = new Random().nextInt(top + 1);

  /// +1 because nextInt top is exclusive
  print("Example30 Guess a number between 0 and ${top}");
  guessNumber(i) {
    if (n == gn) {
      print("Example30 Guessed right! The number is ${gn}");
    } else {
      tooHigh = n > gn;
      print("Example30 Number ${n} is too "
          "${tooHigh ? 'high' : 'low'}. Try again");
    }
    return n == gn;
  }

  n = (top - bottom) ~/ 2;
  while (!guessNumber(n)) {
    if (tooHigh) {
      top = n - 1;
    } else {
      bottom = n + 1;
    }
    n = bottom + ((top - bottom) ~/ 2);
  }
}

example31() {
  findVolume31(int length, int breath, [int? height]) {
    print('length = $length, breath = $breath, height = $height');
  }

  findVolume31(10, 20, 30); //valid
  findVolume31(10, 20); //also valid
}

example32() {
  findVolume32(int length, int breath, {int? height}) {
    print('length = $length, breath = $breath, height = $height');
  }

  findVolume32(10, 20,
      height: 30); //valid & we can see the parameter name is mentioned here.
  findVolume32(10, 20); //also valid
}

example33() {
  findVolume33(int length, int breath, {int height = 10}) {
    print('length = $length, breath = $breath, height = $height');
  }

  findVolume33(10, 20, height: 30); //valid
  findVolume33(10, 20); //valid
}

/// Programs have only one entry point in the main function.
/// Nothing is expected to be executed on the outer scope before a program
/// starts running with what's in its main function.
/// This helps with faster loading and even lazily loading of just what
/// the program needs to startup with.
main() {
  print("Learn Dart in 15 minutes!");
  [
    example1,
    example2,
    example3,
    example4,
    example5,
    example6,
    example7,
    example8,
    example9,
    example10,
    example11,
    example12,
    example13,
    example14,
    example15,
    example16,
    example17,
    example18,
    example19,
    example20,
    example21,
    example22,
    example23,
    example24,
    example25,
    example26,
    example27,
    example28,
    example29,
    example30,
    example31,
    example32,
    example33,
  ].asMap().forEach((index, ef) {
    print("""
    ======example${index + 1}=========
    """);
    ef();
  });
}
