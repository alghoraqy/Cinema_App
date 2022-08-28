abstract class AppStates {}

class InitState extends AppStates {}

class ChangeTabState extends AppStates {}

class GetNowPlayingSuccess extends AppStates {}

class GetNowPlayingError extends AppStates {
  final String error;
  GetNowPlayingError(this.error);
}

class GetTopRatedSuccess extends AppStates {}

class GetTopRatedError extends AppStates {
  final String error;
  GetTopRatedError(this.error);
}

class GetPopulerSuccess extends AppStates {}

class GetPopulerError extends AppStates {
  final String error;
  GetPopulerError(this.error);
}

class GetMovieDetailsSuccess extends AppStates {}

class GetMovieDetailsError extends AppStates {
  final String error;
  GetMovieDetailsError(this.error);
}

class GetActorSuccess extends AppStates {}

class GetActorError extends AppStates {
  final String error;
  GetActorError(this.error);
}

//////////////////////////series

class GetOnTheAirSuccess extends AppStates {}

class GetOnTheAirError extends AppStates {
  final String error;
  GetOnTheAirError(this.error);
}

class GetTopRatedSeiesSuccess extends AppStates {}

class GetTopRatedSeiesError extends AppStates {
  final String error;
  GetTopRatedSeiesError(this.error);
}

class GetPopulerSeiresSuccess extends AppStates {}

class GetPopulerSeiresError extends AppStates {
  final String error;
  GetPopulerSeiresError(this.error);
}

class CheckInternetSuccess extends AppStates {}

class CheckInternetError extends AppStates {}
