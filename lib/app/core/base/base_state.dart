abstract class BaseState<T> {
  const BaseState();

  factory BaseState.loading() = LoadingState<T>;

  factory BaseState.data(T data) = DataState<T>;

  factory BaseState.error(String errorMessage) = ErrorState<T>;
}

class LoadingState<T> extends BaseState<T> {
  const LoadingState();
}

class DataState<T> extends BaseState<T> {
  final T data;

  const DataState(this.data);
}

class ErrorState<T> extends BaseState<T> {
  final String errorMessage;

  const ErrorState(this.errorMessage);
}
