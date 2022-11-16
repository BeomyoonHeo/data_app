import 'dart:convert';

import 'package:data_app/domain/product/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productHttpRepository = Provider<ProductHttpRepository>((ref) {
  return ProductHttpRepository();
});

class ProductHttpRepository {
  //Fake data
  List<Product> list = [
    Product(1, "바나나", 1000),
    Product(2, "딸기", 2000),
    Product(3, "참외", 3000),
  ];

  Product findById(int id) {
    //통신을 하기위해선 Future를 사용해야한다. - 약속(promise) observer pattern
    //http 통신 코드
    Product product = list.singleWhere((product) => product.id == id);
    return product;
  }

  List<Product> findAll() {
    //http 통신 코드
    return list;
  }

  //name, price
  Product insert(Product product) {
    //http 통신 코드(product 전송)

    list = [...list, product];

    return product;
  }

  Product updateById(int id, Product productDto) {
    //http 통신 코드
    list = list.map((product) {
      if (product.id == id) {
        product = productDto;
      } else {
        return product;
      }
      return product;
    }).toList();

    productDto.id = id;

    return productDto;
  }

  int removeProduct(int id) {
    list = list.where((product) => product.id != id).toList();
    //http 통신 코드

    return 1;
  }
}
