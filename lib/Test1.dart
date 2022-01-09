

// Define a function.
import 'package:characters/src/extensions.dart';

void printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
late String description;

void main() {

  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: 'int'}; // Use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.

  List<int> l2 = [1,3,4,6];
  //list.addAll(l2);

  description = 'Feijoada! 2022';
  print(description);

  final bar = 1000000; // Unit of pressure (dynes/cm2)
  final double atm = 1.01325 * bar; // Standard atmosphere

  // String -> int
  var one = int.parse('1');
  assert(one == 1);

// String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

// int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

// double -> String
  String piAsString = 3.14159.toStringAsFixed(3);
  assert(piAsString == '3.142');

  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";
  var s5 = '''
You can create
multi-line strings like this one.
''';

  var s6 = """This is also a
multi-line string.""";

  var s = r'In a raw string, not even \n gets special treatment.';

  var list3 = [1, 2, 3, 55];
  var list2 = [0, ...list3];
  assert(list2.length == 5);

  var list4;
  var list5 = [0, ...?list4];
  assert(list5.length == 1);

  var nav = [
    'Home',
    'Furniture',
    'Plants',
    if (true) 'Outlet'
  ];

  print('Nav: $nav');

  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    '#0',
    for (var element in listOfInts) '#$element'
  ];
  assert(listOfStrings[1] == '#1');

  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};


  var hi = 'Hi 🇩🇰';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  print('The last character: ${hi.characters.last}\n');

  listOfInts.forEach(printElement);

  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  print(loudify('hello123123'));
}

void printElement(int element) {
  print(element);
}

