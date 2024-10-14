import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entites/product_entity.dart';
import 'package:fruits_app/core/errors/failuer.dart';
import 'package:fruits_app/core/repos/product_repo/product_repo.dart';
import 'package:fruits_app/core/service/dataBase_services.dart';

class ProdcutRepoImpl implements ProductRepo {
  final DatabaseServices databaseServices;

  ProdcutRepoImpl(this.databaseServices);
  @override
  Future<Either<Failuer, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseServices.getData(path: 'products')
          as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductEntity.fromJson(e)).toList();

      return right(products);
    } catch (e) {
      return left(Failuer(message: e.toString()));
    }
  }

  @override
  Future<Either<Failuer, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseServices.getData(path: 'products', query: {
        'orderBy': 'sellCount',
        'descending': true,
        'limit': 5,
      }) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductEntity.fromJson(e)).toList();

      return right(products);
    } catch (e) {
      return left(Failuer(message: e.toString()));
    }
  }
}
