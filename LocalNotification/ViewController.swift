//
//  ViewController.swift
//  LocalNotification
//
//  Created by chungguen yu on 2017. 9. 28..
//  Copyright © 2017년 ryuandjo. All rights reserved.
//
import UserNotifications
import UIKit

class ViewController: UIViewController ,UNUserNotificationCenterDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setLocalNotification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setLocalNotification() {
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            let options: UNAuthorizationOptions = [.alert, .sound];
            
            center.requestAuthorization(options: options) {
                (granted, error) in
                if granted {
                    let content = UNMutableNotificationContent()
                    content.categoryIdentifier = "awesomeNotification"
                    content.title = "Notification"
                    content.body = "Body"
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                    let request = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger)
                    let center = UNUserNotificationCenter.current()
                    center.add(request) { (error) in
                        print(error?.localizedDescription ?? "")
                    }
                    
                    print("Setted LocalNotification")
                }
            }
        }
        else
        {
            let notification = UILocalNotification()
            notification.alertBody = "Notification"
            notification.fireDate = NSDate(timeIntervalSinceNow:60) as Date
            notification.repeatInterval = NSCalendar.Unit.minute
            UIApplication.shared.cancelAllLocalNotifications()
            UIApplication.shared.scheduledLocalNotifications = [notification]
        }
    }

}

