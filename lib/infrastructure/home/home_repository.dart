import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:exercise_app/domain/core/failures/main_failure.dart';
import 'package:exercise_app/domain/home/i_home_repo.dart';
import 'package:exercise_app/domain/home/models/home.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: IHomeRepo)
class HomeRepository implements IHomeRepo {
  @override
  Future<Either<MainFailure, List<Home>>> getHomeData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get("https://www.themealdb.com/api/json/v1/1/search.php?f=a");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final homeList = (response.data['meals'] as List).map((e) {
          return Home.fromJson(e);
        }).toList();
        print(homeList);
        print('test1');
        return Right(homeList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
