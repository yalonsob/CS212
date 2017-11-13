import UIKit

class GenreListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var genres: [Genre] = [Genre]()
    
    override func viewDidLoad() {
        
        setUIToDownloading(true)
        
        let url = TMDBURLs.URLForResource(TMDB.Resources.GenreList)
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            // Simple error handling
            if let error = error {
                print(error)
                return
            }
            
            // Update the view controller's state
            self.genres = self.genresFromData(data)
            
            // Send the UI Updating work back to the main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.setUIToDownloading(false)
            }
        }
        
        task.resume()
    }
    
    // MARK: - Toggle UI while downloading
    
    func setUIToDownloading(_ isDownloading: Bool) {
        
        if isDownloading {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
        
        self.activityIndicator.isHidden = isDownloading
        self.tableView.alpha = isDownloading ? 0.2 : 1.0
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    var cellNumber = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        // Get the genre associated with this row out of the array
        let genre = genres[indexPath.row]
        
        // Set the genre name
        cell.textLabel!.text = genre.name
        
        return cell
    }
    
    
    // MARK: - Parser
    
    func genresFromData(_ data: Data?) -> [Genre] {
        
        // No data, return an empty array
        guard let data = data else {
            return []
        }
        
        // Parse the Data into a JSON Object
        let JSONObject = try! JSONSerialization.jsonObject(with: data)
        
        // Insist that this object must be a dictionary
        guard let dictionary = JSONObject as? [String : Any] else {
            assertionFailure("Failed to parse data. data.length: \(data.count)")
            return [Genre]()
        }
        
        // These are the dictionaries that we want to make into genres
        let genresDictionaries = dictionary[TMDB.Keys.Genres] as! [[String : AnyObject]]
        
        // This is where we will put the genres. We will return this array.
        var genres = [Genre]()
        
        // For each dictionary...
        for g in genresDictionaries {
            
            // Make a genre...
            let g = Genre(dictionary: g)
            
            // Put it into the array that we will return
            genres.append(g)
        }
        
        return genres
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movieVC = segue.destination as! MovieListViewController
        let indexPath = tableView.indexPathForSelectedRow!
        movieVC.id = self.genres[indexPath.row].id
        
    }
}

