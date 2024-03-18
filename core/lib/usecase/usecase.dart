abstract class UseCase<Out, In> {
  Future<Out> call({In params});
}

