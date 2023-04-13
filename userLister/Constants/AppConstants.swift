import UIKit

struct Constants {
    struct url {
        static let post = "https://jsonplaceholder.typicode.com/posts"
    }
    
    struct alert {
        static let title: String = "Data Fetch error"
        static let message: String = "An error has happened while fetching the Posts"
        static let retry: String = "Retry"
        static let cancel: String = "Cancel"
    }
}
