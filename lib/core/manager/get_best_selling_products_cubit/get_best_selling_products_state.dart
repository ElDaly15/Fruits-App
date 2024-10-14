part of 'get_best_selling_products_cubit.dart';

@immutable
sealed class GetBestSellingProductsState {}

final class GetBestSellingProductsInitial extends GetBestSellingProductsState {}

final class GetBestSellingProductsSuccess extends GetBestSellingProductsState {
  final List<ProductEntity> products;

  GetBestSellingProductsSuccess({required this.products});
}

final class GetBestSellingProductsFailuer extends GetBestSellingProductsState {
  final String errorMsg;

  GetBestSellingProductsFailuer({required this.errorMsg});
}

final class GetBestSellingProductsLoading extends GetBestSellingProductsState {}
