import 'package:flutter/material.dart';
import 'package:list_produk_yaya/login.dart';

class ListViewExampleApp extends StatelessWidget {
  const ListViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListTileSelectExample(),
    );
  }
}

class ListTileSelectExample extends StatefulWidget {
  const ListTileSelectExample({super.key});

  @override
  ListTileSelectExampleState createState() => ListTileSelectExampleState();
}

class ListTileSelectExampleState extends State<ListTileSelectExample> {
  bool isSelectionMode = false;
  final int listLength = 10;
  late List<bool> _selected;

  @override
  void initState() {
    super.initState();
    initializeSelection();
  }

  void initializeSelection() {
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  void dispose() {
    _selected.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login_Page()),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Data Produk',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: ListBuilder(
          isSelectionMode: isSelectionMode,
          selectedList: _selected,
          onSelectionChange: (bool x) {
            setState(() {
              isSelectionMode = x;
            });
          },
        ));
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    super.key,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  });

  final bool isSelectionMode;
  final List<bool> selectedList;
  final Function(bool)? onSelectionChange;

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class Product {
  final String name;
  final String price;

  Product(this.name, this.price);
}

class _ListBuilderState extends State<ListBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }

  List<Product> products = [
    Product('Bando 08', 'Rp 2.000'),
    Product('Bando 2 cagak', 'Rp 3.000'),
    Product('Bando 20 DN', 'Rp 1.000'),
    Product('Bando 3 daun', 'Rp 2.000'),
    Product('Bando 30', 'Rp 2.000'),
    Product('Bando 35', 'Rp 2.000'),
    Product('Bando 47', 'Rp 3.000'),
    Product('Bando 50', 'Rp 3.000'),
    Product('Bando 75', 'Rp 7.000'),
    Product('Bando 79', 'Rp 7.000'),
    // tambahkan data produk lainnya sesuai kebutuhan
  ];

  void _deleteProduct(int index) {
    setState(() {
      // Hapus produk dari list
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(1.0),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filter Produk',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.close))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.selectedList.length,
                itemBuilder: (_, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // Offsetting shadow vertically
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () => _toggle(index),
                        onLongPress: () {
                          if (!widget.isSelectionMode) {
                            setState(() {
                              widget.selectedList[index] = true;
                            });
                            widget.onSelectionChange!(true);
                          }
                        },
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _deleteProduct(index);
                          },
                        ),
                        title: Text(
                          products[index].name,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Harga: ${products[index].price}',
                          maxLines: 1,
                        ),
                        leading: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.red[100],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
