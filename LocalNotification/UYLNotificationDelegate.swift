//
//  UYLNotificationDelegate.swift
//  LocalNotification
//
//  Created by chungguen yu on 2017. 9. 28..
//  Copyright © 2017년 ryuandjo. All rights reserved.
//

import Foundation
import UserNotifications

class UYLNotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound])
        print("앱이 실행 되고 있거나 알림을 클릭 했을때 호출 된다.")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Custom Action도 가능
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Default")
        default:
            print("Unknown action :: \(response.actionIdentifier)")
        }
    }
}
