//
//  HomePresenter.swift
//  HomePage
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit


protocol HomePresenterInput: HomeInteractorOutput {
    
    
}

protocol HomePresenterOutput: class {
    
    func displayHome(viewModel: [HomeViewModel])

    func displayError(viewModel: HomeModelError)
}

final class HomePresenter {
    
    private(set) weak var output: HomePresenterOutput?
    
    init(output: HomePresenterOutput) {
        
        self.output = output
    }
    
}

extension HomePresenter: HomePresenterInput {
    
    func presentHome(viewModel: [Home]) {
        let model = viewModel.flatMap { (home) -> HomeViewModel? in
            
            return HomeViewModel(name: home.name, email: home.email)
            
        }
        print("Home display model \(model)")
        output?.displayHome(viewModel: model)
    }
    
    
    func presentError(viewModel: Error) {
        
        let errModel = HomeModelError(title: Strings.Error.genericTitle, message: Strings.Error.genericMessage, titleBtn: Strings.Error.okButtonTitle)
        
        output?.displayError(viewModel: errModel)
    }
    
   
   
    
   
    
    

    

}



