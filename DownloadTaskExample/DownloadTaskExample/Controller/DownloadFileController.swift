//
//  DownloadFileController.swift
//  DownloadTaskExample
//
//  Created by Pisal on 5/27/2561 BE.
//  Copyright © 2561 BE Example. All rights reserved.
//

import UIKit

protocol FileCellDelegate {
    func pauseTapped(_ cell: tableCell)
    func resumeTapped(_ cell: tableCell)
    func cancelTapped(_ cell: tableCell)
    func downloadTapped(_ cell: tableCell)
}

class tableCell: UITableViewCell {
    
    var delegate: FileCellDelegate?
    
    @IBOutlet weak var progressDownload: UIProgressView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
   
    @IBAction func pauseOrResumeTapped(_ sender: AnyObject) {
        if(pauseBtn.titleLabel?.text == "Pause"){
            delegate?.pauseTapped(self)
        }else{
            delegate?.resumeTapped(self)
        }
    }
    
    @IBAction func cancelTapped(_ sender: AnyObject) {
        delegate?.cancelTapped(self)
    }
 
    
    @IBAction func downloadTapped(_ sender: AnyObject) {
        delegate?.downloadTapped(self)
     
    }
    
    
    func configure(file: fileDownload, downloaded: Bool,download: Download?){
        titleCell.text = file.name
        
        var showDownloadControls = false
        if let download = download{
            showDownloadControls = true
            let title = download.isDownloading ? "Pause" : "Resume"
            pauseBtn.setTitle(title, for: .normal)
            
        }
        pauseBtn.isHidden = !showDownloadControls
        cancelBtn.isHidden = !showDownloadControls
        progressDownload.isHidden = !showDownloadControls
        // If the track is already downloaded, enable cell selection and hide the Download button
        selectionStyle = downloaded ? UITableViewCellSelectionStyle.gray : UITableViewCellSelectionStyle.none
        downloadBtn.isHidden = downloaded || showDownloadControls
    }
    
    func updateDisplay(progress: Float, totalSize : String) {
        progressDownload.progress = progress
        
    }
}

class DownloadFileController: UITableViewController, UIDocumentInteractionControllerDelegate {

    var searchResults: [fileDownload] = []
    let downloadService = DownloadService()
    var locationFileToRemove: URL! = nil
    var documentInteractionController = UIDocumentInteractionController()
    
    
    
    lazy var downloadsSession: URLSession = {
    
        let configuration = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).backgroundConfiguration")
        print("URL SESSION configuration \(configuration.identifier ?? "")")
        configuration.isDiscretionary = true
        configuration.sessionSendsLaunchEvents = true
        // Warning: If an URLSession still exists from a previous download, it doesn't create a new URLSession object but returns the existing one with the old delegate object attached!
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    // Get local file path: download task stores tune here; AV player plays it.
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    func localFilePath(for url: URL) -> URL {
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Download file controller presenting")
        print("Your download session \(downloadsSession)")
        tableView.tableFooterView = UIView()
//        if !alreadyCreatedSession {
//            if createSession{
//                self.setupSession()
//                createSession = false
//                alreadyCreatedSession = true
//            }
//        }
        
        self.setupSession()
        print("Now your session is \(downloadsSession)")
        documentInteractionController.delegate = self
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func setupSession(){
        
        //downloadService.downloadsSession = downloadsSession
        if SESSION == nil {
            SESSION = self.getSession()
            print("Download identifier \(downloadsSession.configuration.identifier ?? "")")
        }else{
            
            //SESSION.finishTasksAndInvalidate()
            //SESSION = self.getSession()
            print("Already have session \(SESSION.debugDescription)")
        }
        
        
        //downloadsSession.invalidateAndCancel()
    }
    func getSession() -> URLSession {
        let configuration = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).backgroundConfiguration")
        print("URL SESSION configuration \(configuration.identifier ?? "")")
        configuration.isDiscretionary = true
        configuration.sessionSendsLaunchEvents = true
        // Warning: If an URLSession still exists from a previous download, it doesn't create a new URLSession object but returns the existing one with the old delegate object attached!
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return file.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "downloadCell", for: indexPath) as! tableCell

        cell.delegate = self
        let track = file[indexPath.row]
      
        cell.configure(file: track, downloaded: track.downloaded,  download: downloadService.activeDownloads[track.previewURL])

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let track = file[indexPath.row]
        if track.downloaded {
            openDocument(track)
        }
        print("You have selected \(track.name) for row \(track.index)")
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let track = file[indexPath.row]
        print("Amount of file remaining before deleting \(file.count)")
        if editingStyle == .delete {
            file.remove(at: indexPath.row)
            print("Row cell has been removed \(track.name)")
            tableView.beginUpdates()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
            print("Amount of file remaining \(file.count)")
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    func openDocument(_ track: fileDownload){
        locationFileToRemove = track.locationURL.absoluteURL
        documentInteractionController.url = track.locationURL.absoluteURL
        documentInteractionController.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
        
        
    }
    func documentInteractionControllerDidDismissOpenInMenu(_ controller: UIDocumentInteractionController) {
        if locationFileToRemove != nil {
            do{
                try FileManager.default.removeItem(at: locationFileToRemove)
                print("File has been removed")
            }catch let error{
                print("error in removing item \(error.localizedDescription)")
            }
        }else{
            print("There is no file to be removed")
        }
       
    }
    func documentInteractionController(_ controller: UIDocumentInteractionController, didEndSendingToApplication application: String?) {
        print("Your file has been sent to \(String(describing: application))")
        
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
}
extension DownloadFileController: FileCellDelegate {
    func pauseTapped(_ cell: tableCell) {
        if let indexPath = tableView.indexPath(for: cell){
            let downFile = file[indexPath.row]
            downloadService.pauseDownload(downFile)
            reload(indexPath.row)
        }
    }
    
    func resumeTapped(_ cell: tableCell) {
        if let indexPath = tableView.indexPath(for: cell){
            let downFile = file[indexPath.row]
            downloadService.resumeDownload(downFile)
            reload(indexPath.row)
        }
    }
    
    func cancelTapped(_ cell: tableCell) {
        if let indexPath = tableView.indexPath(for: cell){
            let downFile = file[indexPath.row]
            downloadService.cancelDownload(downFile)
            reload(indexPath.row)
        }
    }
    
    func downloadTapped(_ cell: tableCell) {
        print("DOwnload being tapped")
        if let indexPath = tableView.indexPath(for: cell){
            let downFile = file[indexPath.row]
            downloadService.startDownload(downFile)
            reload(indexPath.row)
        }
    }
    
    // Update track cell's buttons
    func reload(_ row: Int) {
        tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
    }
}

