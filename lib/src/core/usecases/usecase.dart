abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
}

abstract class SyncUseCase<Type, Params> {
  Type call({Params params});
}
