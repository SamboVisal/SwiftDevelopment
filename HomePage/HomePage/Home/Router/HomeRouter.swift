//
//  HomeRouter.swift
//  HomePage
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

protocol HomeRouterProtocol {
    
    var viewController: HomeViewController? { get }
    
    
    
}


final class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: HomeViewController?

    init(viewController: HomeViewController) {
        
        self.viewController = viewController
    }
}
