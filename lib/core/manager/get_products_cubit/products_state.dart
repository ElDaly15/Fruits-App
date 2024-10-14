part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> prodcuts;

  ProductsSuccess(this.prodcuts);
}

final class ProductsFailuer extends ProductsState {
  final String msg;

  ProductsFailuer({required this.msg});
}

final class ProductsLoading extends ProductsState {}
