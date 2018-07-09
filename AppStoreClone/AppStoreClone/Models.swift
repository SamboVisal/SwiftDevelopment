//
//  Models.swift
//  AppStoreClone
//
//  Created by Pisal on 6/16/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//


import UIKit

class AppCategory: NSObject {
    var name: String?
    var apps: [App]?
    var type: String?
    
    static func featuredApp() {
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, res, err) in
            if err != nil {
                print(err ?? "")
                return
            }
            do {
                let jsonData: NSDictionary = try(JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary)
                
                var appCategories = [AppCategory]()
                
                
                for dict in jsonData["categories"] as! [[String: Any]] {
                    let appCategory = AppCategory()
                    print(dict)
                    
                    appCategory.setValuesForKeys(dict as [String: AnyObject])
                    appCategories.append(appCategory)
                }
                
                print(appCategories)
            }catch let err {
                print(err)
            }
        }.resume()
    }
    
    static func sampleAppCategories() -> [AppCategory] {
        
        let bestAppCategories = AppCategory()
        bestAppCategories.name = "Best New Apps"
        var apps = [App]()
        let frozenApp = App()
        frozenApp.Name = "Disney Build It: Frozen"
        frozenApp.ImageName = "frozen"
        frozenApp.Category = "Entertainment"
        frozenApp.Price = NSNumber(floatLiteral: 3.99)
        apps.append(frozenApp)
        
        
        bestAppCategories.apps = apps
        
        //print("Best app categories \(bestAppCategories.apps?.count)")
        let bestGameCategories = AppCategory()
        bestGameCategories.name = "Best New Games"
        var bestGameApps = [App]()
        let telepatinApp = App()
        telepatinApp.Name = "Telepaint"
        telepatinApp.ImageName = "Telepaint"
        telepatinApp.Category = "Game"
        telepatinApp.Price = NSNumber(floatLiteral: 2.99)
        bestGameApps.append(telepatinApp)
        //bestGameCategories.apps = bestGameApps
        
        let bestRecommandationCategory = AppCategory()
        bestRecommandationCategory.name = "Recommendation"
        var bestRecommandApp = [App]()
        let recommandApp = App()
        recommandApp.Name = "Donkey"
        recommandApp.ImageName = "Donkey"
        recommandApp.Category = "App"
        recommandApp.Price = NSNumber(floatLiteral: 1.99)
        bestRecommandApp.append(recommandApp)
        bestRecommandApp.append(recommandApp)
        bestRecommandationCategory.apps = bestRecommandApp
        
        
        return [bestAppCategories, bestGameCategories, bestRecommandationCategory, bestRecommandationCategory]
        
    }
    
}
class App: NSObject {
    
    var Id: NSNumber?
    var Name: String?
    var Category: String?
    var ImageName: String?
    var Price: NSNumber?
}

