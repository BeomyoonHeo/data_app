//View -> Controller 요청
import 'package:data_app/domain/product/product.dart';
import 'package:data_app/domain/product/product_http_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//singletone pattern으로 선언됨
final productController = Provider((ref) {
  return ProductController();
});

class ProductController {
  ProductHttpRepository repo = ProductHttpRepository();

  void findAll() {
    List<Product> productList = repo.findAll();
  }
}
