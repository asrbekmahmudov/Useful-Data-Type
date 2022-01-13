
import Foundation

struct Category {
    var id: Int!
    var parentId: Int?
    var children: [Category]?
    var title: String?
    var image: String?
    
    init() {}
    
    init(id: Int, parentId: Int?) {
        self.id = id
        self.parentId = parentId
        children = []
    }
    
    init(parentId: Int?, children: [Category]) {
        self.parentId = parentId
        self.children = children
    }
    
    init(id: Int, parentId: Int?, title: String, image: String) {
        self.id = id
        self.parentId = parentId
        self.title = title
        self.image = image
    }
    
    mutating func addChild(_ child: Category) {
        self.children?.append(child)
    }
    
}
