//
//  PhonesTableViewController.swift
//  NightPorter
//
//  Created by Waihon Yew on 5/26/20.
//  Copyright © 2020 Waihon Yew. All rights reserved.
//

import UIKit

class PhonesTableViewController: UITableViewController {

    var phones: [Phone]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let phone1 = Phone(name: "1907 Wall Set", imageName: "phone-fullscreen1", cellImageName: "image-cell1")
        let phone2 = Phone(name: "1921 Dial Phone", imageName: "phone-fullscreen2", cellImageName: "image-cell2")
        let phone3 = Phone(name: "1937 Desk Set", imageName: "phone-fullscreen3", cellImageName: "image-cell3")
        let phone4 = Phone(name: "1984 Motorola Portable", imageName: "phone-fullscreen4", cellImageName: "image-cell4")
//        phone4.name = "1984 Motorola Portable"
//        phone4.imageName = "phone-fullscreen4"
//        phone4.cellImageName = "image-cell4"
        phones = [phone1, phone2, phone3, phone4]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phones?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath)

        // Configure the cell...
        if let phone = phones?[indexPath.row] {
            cell.textLabel?.text = phone.name
            if let imageName = phone.cellImageName {
                cell.imageView?.image = UIImage(named: imageName)
            }
        }
//        cell.imageView?.image = UIImage(named: "image-cell1")

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
        guard segue.identifier == "ShowPhone",
            // Get the new view controller using segue.destination.
            let phoneViewController = segue.destination as? PhoneViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) else {
            return
        }

        // Pass the selected object to the new view controller.
        phoneViewController.phone = phones?[indexPath.row]
    }

}
