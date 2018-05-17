//
//  AboutController.swift
//  vKdemo
//
//  Created by Pisal on 3/18/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
import Foundation

class AboutUsTableCell: UITableViewCell{
    
    @IBOutlet weak var imageitem: UIImageView!
    @IBOutlet weak var titleitem: UILabel!
    @IBOutlet weak var descitem: UITextView!
    
    
}

class ActivityController: UITableViewController{
    
    var activityData = [[String: AnyObject]]()
    var indexOfCellToExpand: Int!
    var exapndedLabel: UILabel!
    var selectedAtricle: [String: AnyObject]!
    var selectedArticleImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  path = Bundle.main.path(forResource: "AboutUs", ofType: "json")
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        let jsonResult: NSDictionary = try! JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        activityData = jsonResult["activity"] as! [[String: AnyObject]]
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityTableView", for: indexPath) as! AboutUsTableCell
        
        let activity = self.activityData[indexPath.row]
        let photoURL = activity["Photo"] as! String
        let title = activity["Title"] as! String
        let intro = activity["Intro"] as! String
        let image = UIImage(named: photoURL)
        let newimg = UIComponentController.resizeImage(image: image!, targetSize: CGSize(width: 400, height: 400))
        cell.imageitem.image = newimg
        cell.titleitem.text = title
        cell.descitem.text = intro
        
        return cell
    
    }
    
    
}
class PropertyController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    
}

class AccommodationController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("THIS IS ACCOMMODATION")
    }
}

