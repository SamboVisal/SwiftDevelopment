//
//  HomeInteractor.swift
//  HomePage
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

protocol HomeInteractorInput: HomeViewControllerOutput {
    
}

protocol HomeInteractorOutput  {
    
    func presentHome(viewModel: [Home])
    
    func presentError(viewModel: Error)
    
}

final class HomeInteractor: HomeInteractorInput {

    
    var albums: [Home]?

    let output: HomeInteractorOutput
    let worker: HomeWorker
    
    
    init(output: HomeInteractorOutput, worker: HomeWorker = HomeWorker() ) {
        
        self.output = output
        self.worker = worker
    }
    
    func fetchAlbums(artistId: String) {
        
        worker.getData(personId: artistId) { [weak self] (data, err) in
            
            if let strongSelf = self {
                
                if let error = err {
                    strongSelf.output.presentError(viewModel: error)
                }else {
                    strongSelf.albums = data
                    strongSelf.output.presentHome(viewModel: data!)
                }
            }
            
        }
        
    }
    
}

