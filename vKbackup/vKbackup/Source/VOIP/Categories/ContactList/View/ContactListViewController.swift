//
//  ContactListViewController.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/28/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class ContactListController: UITableViewController {
    
    
    
    private let cellId = "cellId"
    private let array = ["one", "two", "three", "four"]
    var filterArray = [String]()
    
    let tableHeaderVariable = TableHeaderVariable()
    
    lazy var searchController: UISearchController = ({
        
        let controller = UISearchController(searchResultsController: nil)
    
        controller.hidesNavigationBarDuringPresentation = false
        controller.searchBar.sizeToFit()
        controller.dimsBackgroundDuringPresentation = true
        controller.searchBar.backgroundColor = UIColor.clear
        controller.searchBar.placeholder = "Search"
        
        return controller
        
    })()
    let label: UILabel = {
        
       
        let label = UILabel()
        label.text = "Sambo Visal"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        
        
        self.customNavigationItem()
        self.customHeaderTableView()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    
    
    
    func customHeaderTableView() {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
       
        headerView.layer.borderWidth = 1
        headerView.layer.borderColor = UIColor.gray.cgColor
        
        headerView.addSubview(tableHeaderVariable.profileImageView)
        
        headerView.addSubview(tableHeaderVariable.profileNameLabel)
        
        headerView.addSubview(tableHeaderVariable.extNumber)
        
        
        
        self.tableView.tableHeaderView = headerView
        
        
    }
    func customNavigationItem() {
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.title = "Contacts"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:
            "addcontact-icon"), style: .plain, target: self, action: nil)
        
    }
    
    
}

extension ContactListController :  UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        if let count = searchController.searchBar.text?.count {
            if count > 0  {
                
                filterArray.removeAll(keepingCapacity: false)
                var a = [String]()
                a = [searchController.searchBar.text!]
                filterArray = a
                searchController.dimsBackgroundDuringPresentation = false
                tableView.reloadData()
            }else {
                searchController.dimsBackgroundDuringPresentation = true
                filterArray.removeAll(keepingCapacity: false)
                filterArray = array
                tableView.reloadData()
            }
        }
        
    }
}

// Table View
extension ContactListController {
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filterArray.count
        }else {
            return array.count
        }
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        if searchController.isActive {
            cell.textLabel?.text = filterArray[indexPath.row]
        }else {
            cell.textLabel?.text = array[indexPath.row]
        }
        
        
        return cell
        
    }
    
}


extension ContactListController : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
       
        print("searchBar did begin editing")
        
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
       print("searchBar did finished editing")
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(" search button has been clicked")
        
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print(" searchBarShouldBeginEditing")
        
        return true
        
        
    }
    
}

