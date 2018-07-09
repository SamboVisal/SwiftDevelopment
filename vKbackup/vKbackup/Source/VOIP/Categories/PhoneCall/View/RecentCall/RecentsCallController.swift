//
//  RecentsCallController.swift
//  vKclub Version 2
//
//  Created by Machintos-HD on 6/30/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit

class RecentsCallController: UITableViewController {
    
    let cellId = "recents"
    var recentCalls : [Recents] = [Recents]()

    
}

// app lifelycel
extension RecentsCallController {
    
    override func viewDidLoad() {
        self.createArray()
        
        
        
    }

    
    
}

// app logic

extension RecentsCallController {
    func createArray() {
        recentCalls.append(Recents(imageUrl: "testing", name: "testing", time: "2h ago"))
        recentCalls.append(Recents(imageUrl: "testing", name: "testing", time: "3h ago"))
        recentCalls.append(Recents(imageUrl: "testing", name: "testing", time: "3h ago"))
        recentCalls.append(Recents(imageUrl: "testing", name: "testing", time: "3h ago"))
        recentCalls.append(Recents(imageUrl: "testing", name: "testing", time: "3h ago"))
        recentCalls.append(Recents(imageUrl: "testing", name: "testing", time: "3h ago"))
        recentCalls.append(Recents(imageUrl: "testing", name: "testing", time: "3h ago"))
        recentCalls.append(Recents(imageUrl: "testing", name: "testing", time: "3h ago"))
        recentCalls.append(Recents(imageUrl: "testing", name: "testing", time: "3h ago"))
        
    }
    
}
