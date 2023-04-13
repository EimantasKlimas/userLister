import UIKit

class MainViewModel {
    let datasource: MainViewDatasource = MainViewDatasource()
    let dataActor: DataActing
    weak var delegate: MainViewInteracting?
    
    init(
        dataActor: DataActing
    ) {
        self.dataActor = dataActor
        // No need to worry about race conditions thanks to using actors
        fetchStoredPosts()
        fetchPosts()
    }
    
    public func refreshPosts() {
        delegate?.startedUpdate()
        fetchPosts()
    }
    
    private func fetchStoredPosts() {
        delegate?.startedUpdate()
        getStoredUsers(datasource.updateUsers)
    }
    
    private func fetchPosts() {
        getUsers(datasource.updateUsers)
    }
    
    private func getUsers(_ completion: @escaping ([Post]) -> Void) {
        Task {
            do {
                let posts = try await dataActor.getPosts()
                try await dataActor.save(posts: posts)
                
                completion(posts)
                delegate?.didUpdate()
            } catch {
                delegate?.didReceiveError(fetchPosts)
            }
        }
    }
    
    private func getStoredUsers(_ completion: @escaping ([Post]) -> Void) {
        Task {
            let storedPosts = await dataActor.posts()
            completion(storedPosts)
            delegate?.didUpdate()
        }
    }
}



