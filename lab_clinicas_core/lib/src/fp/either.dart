sealed class Either<L, R> {}

class Left<L, R> extends Either<L, R> {
  final L valeu;
  Left(this.valeu);
}

class Right<L, R> extends Either<L, R> {
  final R valeu;
  Right(this.valeu);
}
