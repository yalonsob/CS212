import UIKit

class Movie {
    
    struct Keys {
        static let Title = "title"
        static let PosterPath = "poster_path"
        static let ID = "id"
        static let overview = "overview"
    }
    
    var title: String
    var id: Int
    var posterPath: String? = nil
    var overview: String = ""
    var posterImage: UIImage?
    
    // Init from a dictionary.
    init?(dictionary: [String : AnyObject]) {
        
        // Mandatory values
        guard
            let title = dictionary[Keys.Title] as? String,
            let id = dictionary[Keys.ID] as? Int,
            let overview = dictionary[Keys.overview] as? String
        else {
            return nil
        }
        
        // Optional value
        let posterPath = dictionary[Keys.PosterPath] as? String

        // Put the extracted values into the properties
        self.title = title
        self.id = id
        self.posterPath = posterPath
        self.overview = overview
    }
}



