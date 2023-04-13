import UIKit

protocol ActorProviding {
    static func makeDataActor() -> DataActing
}

final public class ActorFactory: ActorProviding {
    static func makeDataActor() -> DataActing {
        return DataActor()
    }
}
