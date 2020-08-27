//
//  Profile.swift
//  BowFolios
//
//  Created by Tianhui Zhou on 8/27/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import Foundation

class Profile {
    
    var name: String
    var discription: String
    
    init?(name: String, discription: String) {
        self.name = name
        self.discription = discription
    }
}
