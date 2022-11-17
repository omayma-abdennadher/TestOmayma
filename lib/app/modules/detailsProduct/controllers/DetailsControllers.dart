import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testflutter/app/models/Product.dart';
import 'package:testflutter/app/services/ProductsServices.dart';

final productDataProvider = FutureProvider<Product>((ref) async {
  return ref.watch(productProvider).getProduct();
});
