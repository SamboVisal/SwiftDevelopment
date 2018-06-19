//
//  ImageVideoController.swift
//  DownloadTaskExample
//
//  Created by Pisal on 5/12/2561 BE.
//  Copyright © 2561 BE Example. All rights reserved.
//

import UIKit
import Photos

class TableVariable: UITableViewCell {
    
    @IBOutlet weak var imageitem: UIImageView!
    
    @IBOutlet weak var titleitem: UILabel!
    
    @IBOutlet weak var introitem: UITextView!
}


class ImageVideoController: UITableViewController {
    var imageData = [[String: AnyObject]]()
    var selectedArticle: [String: AnyObject]!
    var selectedArticleImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Image Video Controller has been called")
        // Do any additional setup after loading the view.
        if let path = Bundle.main.path(forResource: "Images", ofType: "json"){
            let jsonDaata = try? NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
            let jsonResult: NSDictionary = try! JSONSerialization.jsonObject(with: jsonDaata! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            imageData = jsonResult["images"] as! [[String: AnyObject]]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }else {
            print("Cannot get path")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageContent", for: indexPath) as! TableVariable
        let imageView = self.imageData[indexPath.row]
        let photoURL = imageView["Photo"] as! String
        let title = imageView["Title"] as! String
        let intro = imageView["Intro"] as! String
        let image = UIImage(named: photoURL)
        let newImage = HelperClass.resizeImage(image: image!, targetSize: CGSize(width: 400, height: 400))
        cell.imageitem.image = newImage
        cell.titleitem.text = title
        cell.introitem.text = intro
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArticle = imageData[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! TableVariable
        selectedArticleImage = cell.imageitem.image
        self.performSegue(withIdentifier: "Simage", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let details = segue.destination as! ImageWebView
        details.imageData = selectedArticle
    }
    
}
class ImageWebView: UIViewController, UIWebViewDelegate {
    var imageData : [String : AnyObject]!
    var ext: String!
    var urlDownload: URL = URL(string: "some-url")!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !HelperClass.isConnectedToNetwork() {
            
           self.PresentAlertController(title: "Warning", message: "You are not connected to our network.", actionTitle: "Got it")
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Offline", style: .plain, target: self, action: #selector(noInternet))
            return
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(showAction))
        self.navigationItem.title = imageData["Title"] as? String
       
        let url = NSURL (string: (imageData["url"] as? String)!)
        urlDownload = url! as URL
        let request = URLRequest(url: url! as URL)
        self.view.addSubview(webView)
        webView.delegate = self
        webView.scalesPageToFit = true
        webView.contentMode = .scaleAspectFit
        webView.loadRequest(request)
        HelperClass.PresentActivityIndicator(view: self.view, option: true)
        
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("finish")
        HelperClass.PresentActivityIndicator(view: self.view, option: false)
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(error)
        if(error.localizedDescription == "The Internet connection appears to be offline."){
            
            self.PresentAlertController(title: "Something went wrong", message: "Please Check your internet connection ", actionTitle: "Got it")
            
       
            HelperClass.PresentActivityIndicator(view: self.view, option: false)
        }
    }
    func noInternet(){
        self.PresentAlertController(title: "Something went wrong", message: "Please Check your internet connection ", actionTitle: "Got it")
    }
    func downloadImage(){
        //HelperClass.PresentActivityIndicator(view: self.view, option: true)
        print("download image")
        let urlData = NSData(contentsOf: urlDownload as URL)
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        var fileName = imageData["Photo"] as! String
        let fileNameExt = imageData["url"] as! String
        let extFile: String = checkExtension(fileExt: fileNameExt)
        fileName.append(extFile)
        let filePath = "\(documentPath)/\(fileName)"
        DispatchQueue.main.async {
            urlData?.write(toFile: filePath, atomically: true)
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: URL(fileURLWithPath: filePath))
            }, completionHandler: { (done, error) in
                if done {
                    print("Photo has been saved to cameraroll")
                    print("File path ", filePath)
                    try! FileManager.default.removeItem(atPath: filePath)
                    //HelperClass.PresentActivityIndicator(view: self.view, option: false)
                    self.PresentAlertController(title: "Success", message: "The image has been saved to your camera roll.", actionTitle: "Okay")
                    
                }else{
                    print(error ?? "")
                    self.PresentAlertController(title: "Failure", message: "Your attempted file could not be saved. Please try again later.", actionTitle: "Okay")
                    //HelperClass.PresentActivityIndicator(view: self.view, option: false)
                }
            })
        }
    }
    func downloadVideo(){
        
    }
    func showAction(){
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        let saveAction = UIAlertAction(title: "Save to camera roll", style: UIAlertActionStyle.default) { (alert: UIAlertAction) in
            self.downloadImage()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alert: UIAlertAction) in
            print("User choose cancel")
        }
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    func checkExtension(fileExt: String)-> String{
        ext = String(describing: fileExt.suffix(4))
        print("Your extension file is \(ext)")
        return ext
    }
    
}
