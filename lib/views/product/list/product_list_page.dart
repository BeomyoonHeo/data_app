import 'package:data_app/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pc = ref.read(
        productController); // singletone으로 하기 위해서 provider에서 해당 Controller를 가지고 있게 한다.

    pc.findAll();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("product_list_page")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          onTap: () {},
          leading: Icon(Icons.shopping_cart),
          title: Text("바나나", style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("1000"),
        ),
      ),
    );
  }
}
