//
//  UNNotificationCenter.swift
//  DrinkWater
//
//  Created by Terry on 2022/01/13.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationReqeust(by alert: Alert){
        let content = UNMutableNotificationContent()
        content.title = "물마실 시간이에요 💦"
        content.body = "세계보건기구(WHO)가 권장하는 하루 물 섭취량은 1.5~2리터 입니다."
        content.sound = .default
        content.badge = 1
        
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: alert.isOn)
    }
}
