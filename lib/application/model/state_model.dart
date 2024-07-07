class StateModel {
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final dynamic result;

  const StateModel._(
      {this.isLoading = false,
      this.isError = false,
      this.errorMessage = '',
      this.result});

  const StateModel.initial() : this._();

  const StateModel.loading() : this._(isLoading: true);

  const StateModel.loggedIn(dynamic result) : this._(result: result);

  const StateModel.error(String message)
      : this._(isError: true, errorMessage: message);
}
