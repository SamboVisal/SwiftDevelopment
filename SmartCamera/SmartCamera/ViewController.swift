//
//  ViewController.swift
//  SmartCamera
//
//  Created by Pisal on 4/21/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{

    @IBOutlet weak var outputView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        outputView.text = "Hello World"
        let captureSession = AVCaptureSession()
        
        //indicating the quality level or bitrate of the output
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        
        captureSession.addInput(input)
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
    }
  
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        //print("camera was able to capture a frame", Date())
        
        guard let pixelBuffer: CVPixelBuffer =  CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        guard let model = try? VNCoreMLModel(for: Resnet50().model) else {return}
        
        let request = VNCoreMLRequest(model: model) { (finishedReq, error) in
            //print(finishedReq.results)
            guard let result = finishedReq.results as? [VNClassificationObservation] else {
                return
            }
            guard let firstObservation = result.first else { return }
            print(firstObservation.identifier, firstObservation.confidence)
            //self.outputView.text = firstObservation.identifier
            self.outputText(outputText: firstObservation.identifier)
        }
        
        // execute the request, and tell what the object is
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }

    func outputText(outputText: String){
        outputView.text = outputText
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


