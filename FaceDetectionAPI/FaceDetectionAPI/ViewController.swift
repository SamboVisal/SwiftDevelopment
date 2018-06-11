//
//  ViewController.swift
//  FaceDetectionAPI
//
//  Created by Pisal on 6/11/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit
import Vision


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = UIImage(named: "emma2") else {
            return
        }
        
        let imageView = UIImageView(image: image)
        
        let scaleHeight = view.frame.width / image.size.width * image.size.height
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scaleHeight)
        
        
        view.addSubview(imageView)
        
        let request = VNDetectFaceRectanglesRequest { (req, err) in
            if let err = err {
                print("Error to detect face \(err.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                req.results?.forEach({ (res) in
                    print(res)
                    guard let faceObservation = res as? VNFaceObservation else {
                        return
                    }
                    let x = self.view.frame.width * faceObservation.boundingBox.origin.x
                    let height = scaleHeight * faceObservation.boundingBox.height
                    let y = scaleHeight * (1 - faceObservation.boundingBox.origin.y) - height
                    
                    let width = self.view.frame.width * faceObservation.boundingBox.width
                    
                    
                    let redView = UIView()
                    redView.backgroundColor = .red
                    redView.alpha = 0.4
                    redView.frame = CGRect(x: x, y: y, width: width, height: height)
                    self.view.addSubview(redView)
                    print(faceObservation.boundingBox)
                })
            }
            
        }
        
        DispatchQueue.global(qos: .background).async {
            guard let cgImage = image.cgImage else {
                return
            }
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try handler.perform([request])
            }catch let err {
                print("Error in performing request \(err.localizedDescription)")
            }
        }
        
        
        
        
    }


}

