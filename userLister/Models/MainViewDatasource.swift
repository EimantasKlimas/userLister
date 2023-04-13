import UIKit
import Combine

public class MainViewDatasource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private lazy var posts: [Post] = []
    
    public func updateUsers(_ users: Posts) {
        self.posts = users
    }
       
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
        
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let post = posts[safe: indexPath.row],
              let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainViewCell
        else {
            return UITableViewCell()
        }
        
        cell.setup(with: post)
        cell.selectionStyle = .none
        
        return cell
    }
}
