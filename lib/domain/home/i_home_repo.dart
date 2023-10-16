import 'package:exercise_app/domain/core/failures/main_failure.dart';
import 'package:exercise_app/domain/home/models/home.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeRepo{
  Future<Either<MainFailure,List<Home>>> getHomeData();
}