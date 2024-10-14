import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/entites/product_entity.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/repos/product_repo/product_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_best_selling_products_state.dart';

class GetBestSellingProductsCubit extends Cubit<GetBestSellingProductsState> {
  GetBestSellingProductsCubit() : super(GetBestSellingProductsInitial());

  Future<void> getBestSellingProducts() async {
    emit(GetBestSellingProductsLoading());
    var result = await getIt<ProductRepo>().getBestSellingProducts();
    result.fold(
        (failuer) =>
            emit(GetBestSellingProductsFailuer(errorMsg: failuer.message)),
        (products) => emit(GetBestSellingProductsSuccess(products: products)));
  }
}
