Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  //var order;
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() {
// có thể ở đây sẽ mất rất nhiều thời gian
//   return Future.delayed(
//     Duration(seconds: 10),
//     () => 'Large Latte',
//   );

  return Future.sync(
    () => 'Large Latte',
  );

  //return 'Large Latte';
}

Future<void> main() async {
  print('Fetching user order...');

  //var mess = await createOrderMessage();
  //print(createOrderMessage()); // kỳ vọng in ra 'Your order is Large Latte'

  print(await createOrderMessage());
}

// Future<void> printOrderMessage() async {
//   print('Awaiting user order...');
//   var order = await fetchUserOrder();
//   print('Your order is: $order');
// }
//
// Future<String> fetchUserOrder() {
//   // Imagine that this function is more complex and slow.
//   return Future.delayed(const Duration(milliseconds: 2990), () => 'Large Latte');
// }
//
// void main() {
//
//
//   countSeconds(4); //thread
//
//   printOrderMessage();
//
// }
//
// // You can ignore this function - it's here to visualize delay time in this example.
// void countSeconds(int s) {
//   for (var i = 1; i <= s; i++) {
//     Future.delayed(Duration(seconds: i), () => print(i));
//   }
// }
