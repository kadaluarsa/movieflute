class DataWrapper<T> {
  Status status;
  T data;
  String message;

  DataWrapper.init() : status = Status.init;
  DataWrapper.loading() : status = Status.loading;
  DataWrapper.completed(this.data) : status = Status.complete;
  DataWrapper.error(this.message) : status = Status.error;
}

enum Status { loading, complete, error, init }