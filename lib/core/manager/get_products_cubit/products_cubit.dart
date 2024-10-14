import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/entites/product_entity.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/repos/product_repo/product_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await getIt<ProductRepo>().getProducts();
    result.fold((failuer) => emit(ProductsFailuer(msg: failuer.message)),
        (products) => emit(ProductsSuccess(products)));
  }
}
