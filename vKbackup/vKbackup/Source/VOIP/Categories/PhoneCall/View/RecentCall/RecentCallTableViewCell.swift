//
//  RecentCallTableViewCell.swift
//  vKclub Version 2
//
//  Created by Machintos-HD on 6/30/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit

class RecentCallTableViewCell: UITableViewCell {

    var recents : Recents? {
        didSet {
            
        }
    }
    
    
    
 
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
