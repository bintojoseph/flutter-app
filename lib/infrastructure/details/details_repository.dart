import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exercise_app/domain/core/failures/main_failure.dart';
import 'package:exercise_app/domain/details/i_details_repo.dart';
import 'package:exercise_app/domain/details/model/details.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDetailsRepo)
class DetailsRepository implements IDetailsRepo {
  @override
  Future<Either<MainFailure, List<Details>>> getDetails({required int id}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final details = (response.data['meals'] as List).map((e) {
          return Details.fromJson(e);
        }).toList();
        print(details);
        print('test1');
        return Right(details);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (err) {
      print(err);
      return const Left(MainFailure.clientFailure());
    }
  }
}