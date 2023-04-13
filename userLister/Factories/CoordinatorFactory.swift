import UIKit

protocol CoordinatorProviding {
    static func makeMainCoordintor() -> MainCoordinating
}

final public class CoordinatorFactory: CoordinatorProviding {
    static func makeMainCoordintor() -> MainCoordinating {
        return MainCoordintor()
    }
}
