abstract class Usecase<R, Params> {
  R execute({required Params params});
}

class NoParams {}
