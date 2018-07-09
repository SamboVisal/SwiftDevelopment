//
//  KeypadViewController.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/25/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class PhonCallController: UIViewController ,UITextFieldDelegate {
    
    private lazy var diaPadlController: DialPadController = {
        
        var viewController = DialPadController()
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var recentCallController: RecentsCallController = {
        
        
        
        var viewController = RecentsCallController()
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    let phoneCallPropertype = PhoneCellPropertype()
    
    
}

// APP life Cycle
extension PhonCallController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.navigationItem.titleView =  self.phoneCallPropertype.buttonSegment
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        
    }
    
    
}
// APP UI
extension PhonCallController {
    
    
    
    
    
}

// APP Logic

extension PhonCallController {
    
    private func setupView() {
        setupSegmentedControl()
        updateView()
    }
    
    private func updateView() {
        if phoneCallPropertype.buttonSegment.selectedSegmentIndex == 0 {
            self.navigationController?.navigationBar.prefersLargeTitles = false
            remove(asChildViewController: recentCallController)
            add(asChildViewController: diaPadlController)
        } else {
            self.title = "Recents"
            if #available(iOS 11, *) {
                self.navigationController?.navigationBar.prefersLargeTitles = true
                self.navigationController?.navigationItem.largeTitleDisplayMode = .always
            }
            self.navigationController?.navigationBar.largeTitleTextAttributes =
                [NSAttributedStringKey.foregroundColor: UIColor.black,
                 NSAttributedStringKey.font: UIFont.systemFont(ofSize: 30)]
            remove(asChildViewController: diaPadlController)
            add(asChildViewController: recentCallController)
        }
    }
    private func setupSegmentedControl() {
        
        phoneCallPropertype.buttonSegment.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        
    }
    
    // MARK: - Actions
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    
    
    private func add(asChildViewController viewController: UIViewController) {
        
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
}
