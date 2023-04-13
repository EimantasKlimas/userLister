import CoreData

protocol DataActing {
    func getPosts() async throws -> Posts
    func save(posts: Posts) async throws
    func posts() async -> Posts
}

/* Ideally should be both sepparate but app is simple, so its forgivable to keep them together, didnt see a point to caching in this case to add it as well */
actor DataActor: DataActing {
    lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "userLister")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      })
      return container
    }()
    
    private let decoder = JSONDecoder()
    
    public func getPosts() async throws -> Posts {
        guard let url = URL(string: Constants.url.post) else {
            return []
        }
        let request = URLRequest(url: url)
        
        let task: Task<Posts, Error> = Task {
            let (usersData, _) = try await URLSession.shared.data(for: request)
            let users = try decoder.decode(Posts.self, from: usersData)
            return users
        }
        
        return try await task.value
    }
        
    func save(posts: Posts) async throws {
        let context = persistentContainer.viewContext
        
        posts.forEach { post in
            let postData = NSEntityDescription.insertNewObject(forEntityName: "PostData", into: context) as! PostData
            
            postData.title = post.title
            postData.body = post.body
            postData.id = Int64(post.id)
            postData.userId = Int64(post.userId)
        }
        
        try context.save()
    }
    
    func posts() async -> Posts {
      let request: NSFetchRequest<PostData> = PostData.fetchRequest()
      var fetchedPosts: [PostData] = []
      do {
         fetchedPosts = try persistentContainer.viewContext.fetch(request)
      } catch let error {
         print("Error fetching posts \(error)")
      }
      return convert(data: fetchedPosts)
    }
}

private extension DataActor {
    func convert(data: [PostData]) -> Posts {
        data.map { postData in
            Post(
                userId: Int(postData.userId),
                id: Int(postData.id),
                title: postData.title ?? "",
                body: postData.body ?? ""
            )
        }
    }
}

