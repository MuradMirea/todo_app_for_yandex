import 'package:dartz/dartz.dart';
import 'package:todo_app_for_yandex/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
