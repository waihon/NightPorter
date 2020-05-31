//
//  PhoneViewController.swift
//  NightPorter
//
//  Created by Waihon Yew on 5/13/20.
//  Copyright © 2020 Waihon Yew. All rights reserved.
//

import UIKit

class PhoneViewController: UIViewController {

    @IBOutlet weak var phoneNameLabel: UILabel!
    @IBOutlet weak var phoneImageView: UIImageView!

    var phone: Phone?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        phoneNameLabel.text = phone?.name
        if let imageName = phone?.imageName {
            phoneImageView.image = UIImage(named: imageName)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addToCartPressed(_ sender: Any) {
        print("Button tapped")
    }
}
