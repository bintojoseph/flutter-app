import 'package:dartz/dartz.dart';
import 'package:exercise_app/domain/core/failures/main_failure.dart';
import 'package:exercise_app/domain/details/model/details.dart';

abstract class IDetailsRepo{
  Future<Either<MainFailure,List<Details>>> getDetails({required int id});
}