import 'package:flutter/material.dart';
import 'package:fluttertest2/product_list/model/product_item.dart';

class ShopProductUpdateScreen extends StatefulWidget {
  static const routeName = '/shop-product-update';
  final ProductItem? item;

  const ShopProductUpdateScreen({Key? key, this.item}) : super(key: key);

  @override
  _ShopProductUpdateScreenState createState() =>
      _ShopProductUpdateScreenState();
}

class _ShopProductUpdateScreenState extends State<ShopProductUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _imageControler = TextEditingController();
  final Map<String, dynamic> _initValues = {
    'id': -1,
    'name': '',
    'price': '',
    'description': '',
    'image': '',
  };

  @override
  void initState() {
    if (widget.item != null) {
      initValues(widget.item);
    }
    super.initState();
  }

  @override
  void dispose() {
    _imageControler.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as ProductItem?;
    if (args != null) {
      initValues(args);
    }
    super.didChangeDependencies();
  }

  void initValues(ProductItem? item) {
    _initValues['id'] = item?.id;
    _initValues['name'] = item?.name;
    _initValues['price'] = item?.price.toString();
    _initValues['description'] = item?.description;
    _initValues['image'] = item?.image;
    if (item?.image != null) {
      _imageControler.text = item!.image;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                // Save product
                _saveForm();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        const Text('Expanded'),
                        const SizedBox(width: 16.0),
                        Expanded(
                          flex: 1,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('1',
                                      style: TextStyle(
                                          backgroundColor: Colors.brown)))),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: const Align(
                                  alignment: Alignment.center,
                                  child: Text('1',
                                      style: TextStyle(
                                          backgroundColor: Colors.brown)))),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        backgroundColor: Colors.brown),
                                  ))),
                        )
                      ],
                    ),
                    TextFormField(
                      initialValue: _initValues['name'],
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty == true) {
                          return 'Title is required';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _initValues['name'] = value ?? '';
                      },
                    ),
                    TextFormField(
                        initialValue: _initValues['price'],
                        decoration: const InputDecoration(
                          labelText: 'Price',
                        ),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter a price';
                          }
                          if (double.tryParse(value!) == null) {
                            return 'Please enter a valid number';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Please enter a number greater than zero';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _initValues['price'] = value ?? '';
                        }),
                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                      validator: (value) => (value?.isEmpty == true)
                          ? 'Please enter a description'
                          : null,
                      onSaved: (String? value) {
                        _initValues['description'] = value ?? '';
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(8)),
                              child: _imageControler.text.isNotEmpty
                                  ? Image(
                                      image: NetworkImage(_imageControler.text))
                                  : const SizedBox(),
                            ),
                            if (_imageControler.text.isEmpty)
                              IconButton(
                                icon: const Icon(Icons.photo_library),
                                onPressed: () {},
                              ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          fit: FlexFit.tight,
                          child: TextFormField(
                              controller: _imageControler,
                              // initialValue: _initValues['image'],
                              decoration: const InputDecoration(
                                labelText: 'Image URL',
                              ),
                              validator: (value) {
                                if (value?.isEmpty == true) {
                                  return 'Please enter an image URL';
                                }
                                if ((!value!.startsWith('http') &&
                                        !value.startsWith('https')) ||
                                    (!value.endsWith('.png') &&
                                        !value.endsWith('.jpg') &&
                                        !value.endsWith('.jpeg'))) {
                                  return 'Please enter an valid image URL';
                                }
                                return null;
                              },
                              onSaved: (String? value) {
                                _initValues['image'] = value ?? '';
                              }),
                        ),
                      ],
                    )
                  ]),
                ))));
  }

  void _saveForm() {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();

      ProductItem data = ProductItem(
          id: _initValues['id'].toString(),
          name: _initValues['name'],
          price: double.parse(_initValues['price']),
          description: _initValues['description'],
          image: _initValues['image']);

      Navigator.pop(context, data);
    }
  }
}
