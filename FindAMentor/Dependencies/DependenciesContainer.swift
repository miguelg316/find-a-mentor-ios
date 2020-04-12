import Foundation
import Katana
import Tempura


/// Dependencies container for the app
/// Here we can put all the dependencies we are going to use
/// This is injected into the side effects so that they can
/// reuse easily pieces of code
class DependenciesContainer:
  SideEffectDependencyContainer,
  NavigationProvider
{

  // Use the right backend url in Debug and in Release
  #if DEBUG
  static let backendURL: String = "http://https://api-staging.codingcoach.io/"
  #else
  static let backendURL: String = "https://https://api.codingcoach.io/"
  #endif

  // The function that let the dependencies to dispatch other Dispatchable
  var dispatch: PromisableStoreDispatch

  // The function that let the dependencies to retrieve the most updated version of the State
  var getState: GetState

  // The dependencies responsible to handle the navigation in the app
  var navigator: Navigator

  // the manager that hide the interactions with the backend
  var backendManager: BackendManager

  // the manager that handles the login and logout operation
  var authManager: Auth0Manager

  // Initializer of all the dependencies
  required init(dispatch: @escaping PromisableStoreDispatch, getState: @escaping GetState) {
    self.dispatch = dispatch
    self.getState = getState

    self.navigator = Navigator()
    self.backendManager = BackendManagerImpl()
    self.authManager = Auth0ManagerImpl(audience: Self.backendURL)
  }
}
