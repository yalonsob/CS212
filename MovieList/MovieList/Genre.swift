import UIKit

struct Genre {
    
    struct Keys {
        static let Name = "name"
        static let ID = "id"
    }
    
    var name: String = ""
    var id: Int = 0
    
    
    // Init from a dictionary.
    init(dictionary: [String : AnyObject]) {
        name = dictionary[Keys.Name] as! String
        id = dictionary[Keys.ID] as! Int
    }
}
