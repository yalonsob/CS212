//
//  MovieStore.swift
//  MovieList
//
//  Created by Jason Schatz on 11/15/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import Foundation

class MovieStore {
    let name: String
    var movies: [Movie]
    
    init(_ name: String) {
        self.name = name
        self.movies = []
        
        // what if there are saved movies in the file system?
        
        // Read some data from the file system
        if let data = try? Data(contentsOf: fileURL) {
            // Make a JSON Object [[String : Any]]
            let dictionaries = try! JSONSerialization.jsonObject(with: data) as! [[String : Any]]
            
            // for each dictionary, add a movie
            for d in dictionaries {
                movies.append(Movie(dictionary: d)!)
            }
        }
        
        
    }
    
    func add(_ m: Movie) {
        movies.append(m)
        persist()
    }
    
    func remove(_ m: Movie) {
        movies = movies.filter(){$0.id != m.id}
        persist()
    }
    
    func remove(at index: Int) {
        movies.remove(at: index)
        persist()
    }
    
    func contains(_ m: Movie) -> Bool {
        return movies.contains(where: {$0.id == m.id})
    }
    
    func toggle(_ m: Movie) {
        if self.contains(m) {
            self.remove(m)
        } else {
            self.add(m)
        }
    }
    
    func persist() {
        // Make a JSON object from movies
        var dictionaries = [[String : Any]]()
        
        for m in self.movies {
            dictionaries.append(m.dictionary)
        }
        
        //Get data for the JSON object
        let data = try! JSONSerialization.data(withJSONObject: dictionaries)
        
        //Save the data to fileURL
        try! data.write(to: self.fileURL)
        
        print(fileURL)
    }
    
    private var fileURL: URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        
        return documentDirectory.appendingPathComponent(name)
    }
}
