//
//  NotificationController.swift
//  vKdemo
//
//  Created by Pisal on 3/17/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func presentNotification(title: String, body: String, time: Double){
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        let request = UNNotificationRequest(identifier: "alertSth", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
