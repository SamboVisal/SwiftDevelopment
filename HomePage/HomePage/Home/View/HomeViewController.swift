//
//  HomeViewController.swift
//  HomePage
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

protocol HomeViewControllerInput: HomePresenterOutput {
    
}

protocol HomeViewControllerOutput {
    
    var albums: [Home]? { get }
    
    
    /// Tells the output (interactor) to fetch albums for artist
    ///
    /// - parameter artistId: The artist identifier
    func fetchAlbums(artistId: String)
}

final class HomeViewController: UIViewController, ErrorPresenter {
    
    
    
    var output: HomeViewControllerOutput!
    var router: HomeRouterProtocol!
    fileprivate var homeViewModel: [HomeViewModel] = []
    
    var home: Home?
    
    init(home: Home, configurator: HomeConfigurator = HomeConfigurator.sharedInstance) {
        
        self.home = home
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure(configurator: HomeConfigurator.sharedInstance)
    }
    
    private func configure(configurator: HomeConfigurator = HomeConfigurator.sharedInstance){
        
        configurator.configurator(viewController: self)
    }
    var model: HomeViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData(){
        output.fetchAlbums(artistId: "visal")
    }
}

extension HomeViewController: HomeViewControllerInput {
    
    func displayHome(viewModel: [HomeViewModel]) {
        print("Display HOme")
    }
    
    func displayError(viewModel: HomeModelError) {
        
        self.presentError(viewModel: viewModel)
    }
    
    
}
