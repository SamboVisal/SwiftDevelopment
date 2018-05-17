//
//  ViewController.swift
//  shareButton
//
//  Created by Pisal on 5/10/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {
    var docController: UIDocumentInteractionController?
    override func viewDidLoad() {
        super.viewDidLoad()
        docController?.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "download", style: .plain, target: self, action: #selector(share(sender:)))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func share(sender: UIView){
        
        let url = URL(string:"https://www.tutorialspoint.com/swift/swift_tutorial.pdf");
//        let vc = UIActivityViewController(activityItems: [url ?? ""], applicationActivities: [])
//
//        if let popoverController = vc.popoverPresentationController{
//            popoverController.sourceView = self.view
//            popoverController.sourceRect = self.view.bounds
//
//        }
//        self.present(vc, animated: true, completion: nil)
        docController? = UIDocumentInteractionController.init(url: url! as URL)
        
        //docController?.presentPreview(animated: true)
        docController?.presentOpenInMenu(from: sender.bounds, in: self.view, animated: true)
    }

}

