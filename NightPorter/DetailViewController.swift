//
//  DetailViewController.swift
//  NightPorter
//
//  Created by Waihon Yew on 3/30/20.
//  Copyright © 2020 Waihon Yew. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var currentImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let image = UIImage(named: "windows")
        currentImage.image = image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
