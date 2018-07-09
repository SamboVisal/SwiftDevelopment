//
//  ViewController.swift
//  TableView
//
//  Created by Pisal on 7/9/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    private let cellId = "cellId"
    private let array = ["bung", "setting"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Table View"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
        
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.imageView?.image = UIImage(named: array[indexPath.row])
        cell.imageView?.contentMode = .scaleAspectFill
        //cell.textLabel?.text = array[indexPath.row]
        
        
        
        return cell
    }
    

}

