import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var labelID: UILabel!
    
    var movie: Movie!
    var id: Int!
    
    override func viewDidLoad() {
        
        labelID.text = String(self.id)
        
    }

}

