//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by koudai on 2016/11/29.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    //MARK: peropeties
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedMeals = loadMeals() {
            meals += savedMeals
        } else {
            loadSampleMeals()
        }
    }
    
    func loadSampleMeals() {
        let meal1 = Meal.init(name: "Caprese salad", photo: UIImage.init(named: "meal1"), rating: 5)!
        let meal2 = Meal.init(name: "Chicken and Potatoes", photo: UIImage.init(named: "meal2"), rating: 4)!
        let meal3 = Meal.init(name: "Pasta with Meatballs", photo: UIImage.init(named: "meal3"), rating: 3)!
        
        meals += [meal1, meal2, meal3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MealTableViewCell

        // Configure the cell...
        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.image
        cell.ratingControl.rating = meal.rating

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveMeals()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let mealDetailViewController = segue.destination as! MealViewController
            if let selectCell = sender as? MealTableViewCell {
                let indexPath = tableView.indexPath(for: selectCell)
                let selectMeal = meals[(indexPath?.row)!]
                mealDetailViewController.meal = selectMeal
            }
        } else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }
 
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            if let selectIndexPath = tableView.indexPathForSelectedRow {
                meals[selectIndexPath.row] = meal
                tableView.reloadRows(at: [selectIndexPath], with: .none)
            } else {
                let newIndexPath = NSIndexPath.init(row: meals.count, section: 0)
                meals.append(meal)
                tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
            }
            saveMeals()
        }
    }

    //MARK: NSCoding
    func saveMeals() {
        let ifSuccessfulSaved = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path)
        if !ifSuccessfulSaved {
            print("Failed to save meals")
        }
    }
    
    func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path) as? [Meal]
    }
}
