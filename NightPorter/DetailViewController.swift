//
//  DetailViewController.swift
//  NightPorter
//
//  Created by Waihon Yew on 3/30/20.
//  Copyright © 2020 Waihon Yew. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var taskSubtitle: UILabel!
    @IBOutlet weak var currentImage: UIImageView!

    var currentTask: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskTitle.text = currentTask!.title
        taskSubtitle.text = currentTask!.subtitle
        let image = UIImage(named: currentTask!.imageName)
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
