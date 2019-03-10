class AppInitAction {}

class StartLoadingAction {}

class StopLoadingAction {}

class DomainExceptionAction {
  final Exception domainException;
  DomainExceptionAction(this.domainException);
}
