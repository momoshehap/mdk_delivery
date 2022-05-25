abstract class ApiStates {}

class InitApiappState extends ApiStates {}

class NewsBusinessLoadingState extends ApiStates {}

class GetBusinessDataSuccessState extends ApiStates {}

class GetBusinessDataErorrState extends ApiStates {
  final String error;
  GetBusinessDataErorrState(this.error);
}

class ApiSearchLoadingState extends ApiStates {}

class GetSearcheDataSuccessState extends ApiStates {}

class GetSearchDataErorrState extends ApiStates {
  final String error;
  GetSearchDataErorrState(this.error);
}
