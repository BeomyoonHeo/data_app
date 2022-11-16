import 'package:data_app/controller/product_controller.dart';
import 'package:data_app/domain/product/product.dart';
import 'package:data_app/store/product_list_view_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pc = ref.read(
        productController); // singletone으로 하기 위해서 provider에서 해당 Controller를 가지고 있게 한다.
    final pm = ref.watch(productListViewStore);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pc.insert(Product(pm.length + 1, "밤", 1000));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("product_list_page")),
      body: ListView.builder(
        itemCount: pm.length,
        itemBuilder: (context, index) => ListTile(
          key: ValueKey(pm[index].id.toString()),
          onTap: () {},
          leading: IconButton(
            onPressed: () {
              pc.delete(pm[index].id);
            },
            icon: Icon(Icons.shopping_cart),
          ),
          title: Text("${pm[index].name}",
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("${pm[index].price}"),
        ),
      ),
    );
  }
}
