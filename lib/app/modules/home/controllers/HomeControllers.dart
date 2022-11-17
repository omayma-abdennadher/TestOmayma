import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testflutter/app/models/Product.dart';
import 'package:testflutter/app/services/ProductsServices.dart';

final productsDataProvider = FutureProvider<List<Product>>((ref) async {
  return ref.watch(productProvider).getProducts();
});
