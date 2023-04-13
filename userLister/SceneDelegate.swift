import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var coordinator = CoordinatorFactory.makeMainCoordintor()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        coordinator.coordinate(with: windowScene)
    }
}


