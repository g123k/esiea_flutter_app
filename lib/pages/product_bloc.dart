import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/api/model/product_api.dart';
import 'package:untitled5/api/off_api.dart';
import 'package:untitled5/model/product.dart';

abstract class ProductEvent {}

class LoadProductEvent extends ProductEvent {}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.barcode)
      : assert(barcode.isNotEmpty),
        super(ProductNotifierLoadingState()) {
    on<LoadProductEvent>(_loadProduct);
    add(LoadProductEvent());
  }

  final String barcode;

  Future<void> _loadProduct(
    ProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final OFFServerResponse response =
          await OFFAPIManager().loadProduct(barcode);
      emit(ProductNotifierSuccessState(response.response.generateProduct()));
    } catch (e) {
      emit(ProductNotifierErrorState(e));
    }
  }
}

sealed class ProductState {}

class ProductNotifierLoadingState extends ProductState {}

class ProductNotifierSuccessState extends ProductState {
  final Product product;

  ProductNotifierSuccessState(this.product);
}

class ProductNotifierErrorState extends ProductState {
  final dynamic error;

  ProductNotifierErrorState(this.error);
}
