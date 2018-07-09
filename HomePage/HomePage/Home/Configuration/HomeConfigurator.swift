//
//  HomeConfigurator.swift
//  HomePage
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

final class HomeConfigurator {
    
    static let sharedInstance = HomeConfigurator()
    
    
    func configurator(viewController: HomeViewController) {
        
        let router = HomeRouter(viewController: viewController)
        let presenter = HomePresenter(output: viewController)
        let interactor = HomeInteractor(output: presenter)
        
        viewController.output = interactor
        viewController.router = router
        
    }
    
}
