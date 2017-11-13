import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet var overview: UITextView!
    
    var imageView: UIImageView!

    var movie: Movie!
    
    override func viewDidLoad() {
        
        overview.text = movie.overview
        
        if movie.posterPath == nil {
            // api node has no imagepath
            self.imageView!.image = UIImage(named: "noImage")
        } else {
            // get url,
            let url = TMDBURLs.URLForPosterWithPath(movie.posterPath!)
            print(url)
            
            // create task
            let task = URLSession.shared.dataTask(with: url, completionHandler: {
                data, response, error in
                
                if let error = error {
                    print(error)
                }
                
                if data == nil {
                    return
                }
                
                let image = UIImage(data: data!)!
                self.movie.posterImage = image
                
                DispatchQueue.main.async {
                    self.imageView = UIImageView(image: image)
                    self.imageView!.frame = CGRect(x: 60, y: 80, width: 200, height: 280)
                    self.view.addSubview(self.imageView!)
                }
            })
            
            // resume task
            task.resume()
        }
    }

}

