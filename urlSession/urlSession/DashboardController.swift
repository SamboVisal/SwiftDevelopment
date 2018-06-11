//
//  ViewController.swift
//  urlSession
//
//  Created by Pisal on 5/18/2561 BE./Users/pisal/Desktop/Xcode/SwiftDevelopment/urlSession/urlSession/AppDelegate.swift
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class DashboardController: UIViewController {

    var urlResult: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    @IBAction func downloadClick(_ sender: Any) {
        urlResult = URL(string: "http://www.pdf995.com/samples/pdf.pdf")
        self.performSegue(withIdentifier: "DownloadSegue", sender: self)
    }
    
}

