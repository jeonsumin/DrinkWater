//
//  AlertListCell.swift
//  DrinkWater
//
//  Created by Terry on 2022/01/13.
//

import UIKit
import UserNotifications

class AlertListCell: UITableViewCell {
    
    @IBOutlet var meridiemLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var alertSwitch: UISwitch!
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              var alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return }
        
        alerts[sender.tag].isOn = sender.isOn
        UserDefaults.standard.set(try? PropertyListEncoder().encode([alerts]), forKey: "alerts")
        
        if sender.isOn {
            userNotificationCenter.addNotificationReqeust(by: alerts[sender.tag])
        }else {
            userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[sender.tag].id])
        }
    }
}
