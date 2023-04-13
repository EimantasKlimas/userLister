import Foundation
import CoreData

extension PostData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostData> {
        return NSFetchRequest<PostData>(entityName: "PostData")
    }

    @NSManaged public var userId: Int64
    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension PostData : Identifiable {

}
