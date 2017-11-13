import UIKit

class PersonListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //var movies: [Movie] = [Movie]()
    var persons: [Person] = [Person]()
    var id: Int!
    
    override func viewDidLoad() {
        
        setUIToDownloading(true)
        
        let url = TMDBURLs.URLForResource(TMDB.Resources.MovieIDCredits, withId: self.id)
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            // Simple error handling
            if let error = error {
                print(error)
                return
            }
            
            // Update the view controller's state
            //self.movies = self.moviesFromData(data)
            self.persons = self.personsFromData(data)
            
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
        //return movies.count
        return persons.count
    }
    
    var cellNumber = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        // Get the movie associated with this row out of the array
        //let movie = movies[indexPath.row]
        var person = persons[indexPath.row]
        
        // Set the movie title
        //cell.textLabel!.text = movie.title
        cell.textLabel!.text = person.name
        
        // Set the movie poster
        
        //if movie.posterPath == nil {
        if person.imagePath == "" {
            // api node has no imagepath
            cell.imageView!.image = UIImage(named: "noImage")
        } else {
            // Set a placeholder before we start the download
            cell.imageView!.image = UIImage(named: "placeHolder")
            
            // get url,
            //let url = TMDBURLs.URLForPosterWithPath(movie.posterPath!)
            let url = TMDBURLs.URLForProfileWithPath(person.imagePath)
            
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
                
                //movie.posterImage = image
                person.profileImage = image
                
                DispatchQueue.main.async {
                    cell.imageView!.image = image
                }
            })
            
            // resume task
            task.resume()
            
        }
        
        return cell
    }
    
    
    // MARK: - Parser
    
    /*func moviesFromData(_ data: Data?) -> [Movie] {
        
        // No data, return an empty array
        guard let data = data else {
            return []
        }
        
        // Parse the Data into a JSON Object
        let JSONObject = try! JSONSerialization.jsonObject(with: data)
        
        // Insist that this object must be a dictionary
        guard let dictionary = JSONObject as? [String : Any] else {
            assertionFailure("Failed to parse data. data.length: \(data.count)")
            return [Movie]()
        }
        
        // These are the dictionaries that we want to make into movies
        let movieDictionaries = dictionary[TMDB.Keys.Cast] as! [[String : AnyObject]]
        
        // This is where we will put the movies. We will return this array.
        var movies = [Movie]()
        
        // For each dictionary...
        for d in movieDictionaries {
            
            // Make a movie...
            let m = Movie(dictionary: d)!
            
            // Put it into the array that we will return
            movies.append(m)
        }
        
        return movies
    }*/
    
    func personsFromData(_ data: Data?) -> [Person] {
        
        // No data, return an empty array
        guard let data = data else {
            return []
        }
        
        // Parse the Data into a JSON Object
        let JSONObject = try! JSONSerialization.jsonObject(with: data)
        
        // Insist that this object must be a dictionary
        guard let dictionary = JSONObject as? [String : Any] else {
            assertionFailure("Failed to parse data. data.length: \(data.count)")
            return [Person]()
        }
        
        // These are the dictionaries that we want to make into movies
        let personDictionaries = dictionary[TMDB.Keys.Cast] as! [[String : AnyObject]]
        
        // This is where we will put the movies. We will return this array.
        //var movies = [Movie]()
        var persons = [Person]()
        
        // For each dictionary...
        for p in personDictionaries {
            
            // Make a movie...
            let p = Person(dictionary: p)
            
            // Put it into the array that we will return
            persons.append(p)
        }
        
        return persons
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movieVC = segue.destination as! MovieListViewController
        let indexPath = tableView.indexPathForSelectedRow!
        movieVC.id = self.persons[indexPath.row].id
        
    }
}

