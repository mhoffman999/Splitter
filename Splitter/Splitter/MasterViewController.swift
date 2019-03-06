//
//  MasterViewController.swift
//  Splitter
//
//  Created by Michael Hoffman on 3/4/19.
//  Copyright © 2019 Here We Go. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    
    //Because of adding own code to viewDidLoad, will not need the following variables
    //Also, because data will be coming from the imageArray in the static data
//    var detailViewController: ImagePresentationVC? = nil
//    var objects = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
/*
        navigationItem.leftBarButtonItem = editButtonItem


        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))

        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
 */
    }

/*
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }


    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
*/
    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                //let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! ImagePresentationVC //changed from detailViewController
                //This pulls the image for the tapped cell
                controller.image = imageArray[indexPath.row] //changed from "detailItem" to project created variable
                
                //This code creates the "-><-" button on the rotated split-screen to enlarge the image and returnit to the master VC
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //let object = objects[indexPath.row] as! NSDate Using own data information
        //cell.textLabel!.text = object.description
        
        cell.textLabel!.text = namesArray[indexPath.row]
        cell.backgroundColor = colorsArray[indexPath.row]
        return cell
    }
    
    //This func is only called for the aesthetics of the tableview cell
    //Without calling this func, the tapped cell would stay "grayed-out" until another selection was made
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //This func will allows viewer to see all of the available cells in portrait &landscape orientation
    //Asks for the specific height to make each cell, which can be defined by an actual number or by calculating versus tableview height and some other info
    //If the Storyboard has a given tableview height constant, uncheck it (and the any cell height constant)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Needed if the controllers are showing a navigation bar 
        if let navBarHeight = navigationController?.navigationBar.frame.height {
            return (tableView.frame.height - navBarHeight) / (CGFloat(imageArray.count))
        } else {
            return (tableView.frame.height - 50) / (CGFloat(imageArray.count))
        }
    }

/*
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
*/

}

