//View -> Controller 요청
import 'package:data_app/domain/product/product.dart';
import 'package:data_app/domain/product/product_http_repository.dart';
import 'package:data_app/store/product_list_view_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//singletone pattern으로 선언됨
final productController = Provider<ProductController>((ref) {
  //final로 선언하여 singletone으로 유지한다.
  return ProductController(ref);
});

class ProductController {
  final Ref _ref;
  ProductController(this._ref);

  ProductHttpRepository repo = ProductHttpRepository();

  void findAll() {
    List<Product> productList = _ref.read(productHttpRepository).findAll();
    _ref.read(productListViewStore.notifier).onRefresh(productList);
  }

  void insert(Product productReqDto) {
    Product productRespDto =
        _ref.read(productHttpRepository).insert(productReqDto);
    _ref.read(productListViewStore.notifier).addProduct(productRespDto);
  }

  void delete(int id) {
    _ref.read(productHttpRepository).deleteById(id);
    findAll();
  }
}
