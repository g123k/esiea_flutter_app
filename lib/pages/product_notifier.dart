import 'package:flutter/cupertino.dart';
import 'package:untitled5/model/product.dart';

class ProductNotifier extends ValueNotifier<ProductNotifierState> {
  ProductNotifier(this.barcode)
      : assert(barcode.isNotEmpty),
        super(ProductNotifierLoadingState()) {
    loadProduct();
  }

  final String barcode;

  Future<void> loadProduct() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      value = ProductNotifierSuccessState(generateProduct());
    } catch (e) {
      value = ProductNotifierErrorState(e);
    }
  }
}

sealed class ProductNotifierState {}

class ProductNotifierLoadingState extends ProductNotifierState {}

class ProductNotifierSuccessState extends ProductNotifierState {
  final Product product;

  ProductNotifierSuccessState(this.product);
}

class ProductNotifierErrorState extends ProductNotifierState {
  final dynamic error;

  ProductNotifierErrorState(this.error);
}
