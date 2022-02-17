import 'package:flutter/material.dart';
import 'package:fluttertest2/product_list/model/product_item.dart';
import 'package:fluttertest2/product_list/view/shop_product_update_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const ShopProductListScreen(),
      //debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      routes: {
        // static router
        // '/': (_) => HomePage(), // You can also use MaterialApp's `home` property instead of '/'
        // No way to pass an argument to FooPage.
        ShopProductListScreen.routeName: (context) =>
            const ShopProductListScreen(),
      },
      onGenerateRoute: generateRoute,
      // generate router
      // onUnknownRoute: (settings) => MaterialPageRoute(
      //   builder: (context) => const Text('Unknown route'),
      // ),
    );
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    if (settings.name == ShopProductUpdateScreen.routeName) {
      return MaterialPageRoute(
          builder: (_) {
            //some custom code
            return const ShopProductUpdateScreen();
          },
          settings: settings);
    }
    return null;
  }
}

class ShopProductListScreen extends StatefulWidget {
  static const routeName = '/shop-product-list';

  const ShopProductListScreen({Key? key}) : super(key: key);

  @override
  State<ShopProductListScreen> createState() => _ShopProductListScreenState();
}

class _ShopProductListScreenState extends State<ShopProductListScreen> {
  final List<ProductItem> items = <ProductItem>[
    ProductItem(
        id: '1',
        name: 'Product 1',
        price: 100,
        image:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        description: 'Ok'),
    ProductItem(
        id: '2',
        name: 'Product 2',
        price: 100,
        image:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        description: 'Ok'),
    ProductItem(
        id: '3',
        name: 'Product 3',
        price: 100,
        image:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        description: 'Ok'),
    ProductItem(
        id: '4',
        name: 'Product 4',
        price: 100,
        image:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        description: 'Ok'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Products'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                // using static router
                final result = await Navigator.pushNamed(
                    context, ShopProductUpdateScreen.routeName);
                debugPrint('$result');
                setState(() {
                  if (result != null) {
                    items.add(result as ProductItem);
                    items.sort((a, b) => a.name.compareTo(b.name));
                  }
                });
              },
            ),
          ],
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final ProductItem item = items[index];
              return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image),
                  ),
                  title: Text(item.name),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.purple,
                        ),
                        onPressed: () async {
                          // using generate router
                          //DuyLH - chuc nang update giao dien khi edit thanh cong 1 item
                          final result = await Navigator.pushNamed(
                            context,
                            ShopProductUpdateScreen.routeName,
                            arguments: item,
                          );

                          setState(() {
                            if (result != null) {

                              items[index] = (result as ProductItem);

                              items.sort((a, b) => a.name.compareTo(b.name));
                            }
                          });
                        }),
                    IconButton(
                        icon: const Icon(
                          Icons.domain,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          // using dynamic router
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopProductUpdateScreen(
                                item: item,
                              ),
                            ),
                          );
                        }),
                    IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            items.remove(item);
                          });
                        }),
                  ]));
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: items.length));
  }
}
