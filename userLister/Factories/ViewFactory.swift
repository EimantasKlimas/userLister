import UIKit

protocol ViewProviding {
    static func makeMainViewController(_ coordinator: MainCoordinating) -> UIViewController
}

final public class ViewFactory: ViewProviding {
    static func makeMainViewController(_ coordinator: MainCoordinating) -> UIViewController {
        return MainViewController(
            mainViewModel: MainViewModel(
                dataActor: ActorFactory.makeDataActor()
            ),
            mainCoordinator: coordinator
        )
    }
}
