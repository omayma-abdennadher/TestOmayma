import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../models/Product.dart';

final productProvider = Provider<ProductService>((ref) => ProductService());

class ProductService {
  Future<List<Product>> getProducts() async {
    Response response = await get(Uri.parse(
        "https://fakestoreapi.com/products?fbclid=IwAR2yLhmTope8nYxciVO-UbIseDMTjZMoL_4kXLUUcpQfu3GJLv3NWNvfGBs"));
    if (response.statusCode == 200) {
      final List listProduct = jsonDecode(response.body);
      return listProduct.map(((product) => Product.fromJson(product))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Product> getProduct() async {
    Response response =
        await get(Uri.parse("https://fakestoreapi.com/products/1"));
    if (response.statusCode == 200) {
      final product = jsonDecode(response.body);
      return Product.fromJson(product);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
