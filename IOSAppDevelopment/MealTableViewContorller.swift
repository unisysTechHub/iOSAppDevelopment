//
//  MealTableViewContorller.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 10/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

class MealTableViewContorller: UITableViewController {
    var meals = [Meal]()
    override func viewDidLoad() {
        super.viewDidLoad()
          loadSampleData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell
        else
       {
         fatalError("TableviewCell instasnce not found with the identifier")
    
        }
        

        // Configure the cell...
        
        cell.nameLabel.text = meals[indexPath.row].name
        cell.photo.image = meals[indexPath.row].photo
        cell.RatingControl.rating = meals[indexPath.row].rating

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func loadSampleData()
    {
        guard let meal1 = Meal(name: "Caprese salad", photo: UIImage(named: "meal1"), rating: 4) else
        {
            print("unable to istantiate meal")
            
            return
        }
        
        guard let meal2 = Meal(name: "Chicken and Potatoes", photo: UIImage(named: "meal2"), rating: 5)  else
               {
                   print("unable to istantiate meal")
                   
                   return
               }
        
        guard let meal3 = Meal(name: "Pasta with Meatballs", photo: UIImage(named: "meal3"), rating: 3    )
          else
               {
                   print("unable to istantiate meal")
                   
                   return
               }
        
        meals += [meal1, meal2, meal3]
        
        
    }
    
    @IBAction func unwindToMealList(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
        // Use data from the view controller which initiated the unwind segue
    }
    
    
    
}

 
