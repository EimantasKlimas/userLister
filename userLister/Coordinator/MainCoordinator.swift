import UIKit
import Combine

protocol MainCoordinating: AnyObject {
    func coordinate(with scene: UIWindowScene)
    func presentError(_ completion: @escaping () -> Void)
}

final public class MainCoordintor: MainCoordinating {
    var navigationController: UINavigationController?
    var window: UIWindow?
    var cancellables = Set<AnyCancellable>()
    
    func coordinate(with scene: UIWindowScene) {
        //Needs to be reworked to be in factory
        navigationController = UINavigationController(
            rootViewController: ViewFactory.makeMainViewController(self)
        )
        
        window = WindowFactory.makeMainWindow()
        window?.windowScene = scene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func presentError(_ completion: @escaping () -> Void) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let alert = UIAlertController(
                title: Constants.alert.title,
                message: Constants.alert.message,
                preferredStyle: UIAlertController.Style.alert
            )
            
            alert.addAction(
                UIAlertAction(
                    title: Constants.alert.cancel,
                    style: UIAlertAction.Style.default,
                    handler: nil
                )
            )
            alert.addAction(
                UIAlertAction(
                    title: Constants.alert.retry,
                    style: UIAlertAction.Style.default,
                    handler: { _ in
                        Task {
                            try await Task.sleep(
                                until: .now + .seconds(1),
                                tolerance: .seconds(2),
                                clock: .suspending
                            )
                            completion()
                        }
                    }
                )
            )
            
            self.navigationController?.present(alert, animated: true)
        }
    }
}

