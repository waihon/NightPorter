//
//  Phone.swift
//  NightPorter
//
//  Created by Waihon Yew on 5/31/20.
//  Copyright © 2020 Waihon Yew. All rights reserved.
//

import Foundation

class Phone: NSObject {
    var name: String?
    var imageName: String?
    var cellImageName: String?
    
    override init() {
        super.init()
    }
    
    init(name: String, imageName: String, cellImageName: String) {
        self.name = name
        self.imageName = imageName
        self.cellImageName = cellImageName
    }
}
