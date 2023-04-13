import UIKit

protocol WindowProviding {
    static func makeMainWindow() -> UIWindow
}

final public class WindowFactory: WindowProviding {
    static func makeMainWindow() -> UIWindow {
        return UIWindow(frame: UIScreen.main.bounds)
    }
}
