//
//  ViewController.swift
//  FirstTable
//
//  Created by Yolanda Alonso on 10/19/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Remember which rows have check marks
    var selectedIndexes = Set<Int>()
    
    //Remember some items for our table
    var fruits = ["Apple", "Mango", "Lemon", "Pear", "Orange", "Pineapple", "Persimon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //The size of the fruits array determines the number of rows in the table
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Get a cell to decorate
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne")!
        
        //Set or unset the checkmark
        if selectedIndexes.contains(indexPath.row) {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        //Set the text
        cell.textLabel?.text = fruits[indexPath.row]
        
        //print("Get Cell Number \(indexPath.row)")
        return cell
    }
    
    //Invoked when a table cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("Selected row \(indexPath.row)")
        
        //Toggle whether or not the row number is in the set
        if selectedIndexes.contains(indexPath.row) {
            selectedIndexes.remove(indexPath.row)
        } else {
            selectedIndexes.insert(indexPath.row)
        }
    
        //tableView.reloadData() //It will repaint the table when the data changes!
        
        //Reload the row, so that we can see the change
        tableView.reloadRows(at: [indexPath], with: .fade)
    }

}

