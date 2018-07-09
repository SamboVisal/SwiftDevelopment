//
//  ErrorPresenter.swift
//  HomePage
//
//  Created by Pisal on 6/24/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

protocol ErrorPresenter {
    
    func presentError(viewModel: HomeModelError)
}

extension ErrorPresenter where Self: UIViewController {
    
    func presentError(viewModel: HomeModelError) {
        
        print("Error")
    }
    
}
