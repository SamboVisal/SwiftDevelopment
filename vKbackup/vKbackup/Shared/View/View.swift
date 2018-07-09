//
//  View.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/25/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import Foundation
import UIKit

class View {
    
    static func squareFrame( midX : CGFloat,midY:CGFloat , pX : CGFloat,pY:CGFloat , w: CGFloat ,h:CGFloat ) -> CGRect {
        
        return CGRect(x: midX * pX, y: midY * pY, width: w , height: h )
    }
    
    
}
