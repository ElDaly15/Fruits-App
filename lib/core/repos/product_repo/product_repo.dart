import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entites/product_entity.dart';
import 'package:fruits_app/core/errors/failuer.dart';

abstract class ProductRepo {
  Future<Either<Failuer, List<ProductEntity>>> getProducts();
  Future<Either<Failuer, List<ProductEntity>>> getBestSellingProducts();
}
