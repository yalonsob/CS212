import UIKit

struct Person {
    
    struct Keys {
        static let Name = "name"
        static let ID = "id"
        static let ProfilePath = "profile_path"
        //static let Movies = "movies"
    }
    
    var name: String = ""
    var id: Int = 0
    var imagePath: String = ""
    var profileImage: UIImage?
    
    
    // Init from a dictionary.
    init(dictionary: [String : AnyObject]) {
        name = dictionary[Keys.Name] as! String
        id = dictionary[Keys.ID] as! Int
        
        if let pathForImage = dictionary[Keys.ProfilePath] as? String {
            imagePath = pathForImage
        }
    }
}

