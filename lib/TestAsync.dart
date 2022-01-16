

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  //var order;
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() {
// có thể ở đây sẽ mất rất nhiều thời gian
  return   Future.delayed(
    Duration(seconds: 2),
        () => 'Large Latte',
  );
}

Future<void> main() async {
  print('Fetching user order...');

  //var mess = await createOrderMessage();
  print(await createOrderMessage());// kỳ vọng in ra 'Your order is Large Latte'
}


