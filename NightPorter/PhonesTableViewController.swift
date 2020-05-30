//
//  PhonesTableViewController.swift
//  NightPorter
//
//  Created by Waihon Yew on 5/26/20.
//  Copyright © 2020 Waihon Yew. All rights reserved.
//

import UIKit

class PhonesTableViewController: UITableViewController {

    var productNames: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        productNames = [
            "1907 Wall Set",
            "1921 Dial Phone",
            "1937 Desk Set",
            "1984 Motorola Portable"
        ]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productNames?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath)

        // Configure the cell...
        if let productName = productNames?[indexPath.row] {
            cell.textLabel?.text = productName
        }
        cell.imageView?.image = UIImage(named: "image-cell1")

        return cell
    }

    // The row height set for the prototype cell seemed not recognized.
    // So, set it programmatically during runtime.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowPhone" else {
            return
        }

        // Get the new view controller using segue.destination.
        guard let phoneViewController = segue.destination as? PhoneViewController else {
            return
        }

        // Pass the selected object to the new view controller.
        phoneViewController.phoneName = "Really Old Phone"
    }

}
