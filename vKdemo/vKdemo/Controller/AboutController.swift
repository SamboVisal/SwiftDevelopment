//
//  AboutController.swift
//  vKdemo
//
//  Created by Pisal on 3/18/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit

class AboutController: UITableViewController {
    
    let names = ["Villa Suite","Villa Jasmine","Bun Galow","Borey V","Borey R","Borey A"]
    let aboutUsArray = [
        ["Villa Suite","Villa Jasmine","Bun Galow","Borey V","Borey R","Borey A"],
        ["Pine View Restaurant","Mountain Bike","Massage","Conference Room"],
        ["TypeA","TypeV","TypeR"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "About Us"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Index Path", style: .plain,target: self, action: #selector(handleShowIndexpath))
    }
    @objc func handleShowIndexpath(){
        print("Attempting something")
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.reloadRows(at: [indexPath], with: .right)
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.green
        return label
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return aboutUsArray.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return names.count
//        }
//        return 2
        return aboutUsArray[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
//        let name = names[indexPath.row]
        let name = aboutUsArray[indexPath.section][indexPath.row]
        cell.textLabel?.text = name
        cell.textLabel?.text = "\(name) Section: \(indexPath.section) Row: \(indexPath.row)"
        return cell
        
    }
    
    
}

