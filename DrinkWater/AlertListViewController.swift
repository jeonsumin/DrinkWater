//
//  AlertListViewController.swift
//  DrinkWater
//
//  Created by Terry on 2022/01/13.
//

import UIKit
import UserNotifications


class AlertListViewController: UITableViewController {
    //MAKR: - Properties
    var alerts: [Alert] = []
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    //MAKR: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "AlertListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "AlertListCell")
        let authrizationOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        userNotificationCenter.requestAuthorization(options: authrizationOptions) {didAlow , error in
            if let error = error {
                print("ERROR: notification authrization request \(error.localizedDescription)")
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alerts = alertList()
    }
    //MAKE: - IBAction
    @IBAction func addAlertButtonTapped(_ sender: Any) {
        guard let addAlertVC = storyboard?.instantiateViewController(withIdentifier: "AddAlertViewController") as? AddAlertViewController else { return }
        addAlertVC.pickedDate = {[weak self] date in
            guard let self = self else { return }
            
            var alertList = self.alertList()
            let newAlert = Alert(date: date, isOn: true)
            
            alertList.append(newAlert)
            alertList.sort{ $0.date < $1.date }
            
            self.alerts = alertList
            
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            self.userNotificationCenter.addNotificationReqeust(by: newAlert)
            self.tableView.reloadData()
        }
        present(addAlertVC, animated: true, completion: nil)
    }
    
    //MAKE: - Fuction
    func alertList() -> [Alert]{
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              // JSON ???????????? ????????? ???????????????????????? ?????? ??? ????????? ????????? ????????? ????????????.
              let alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else {
                  return []
              }
        return alerts
    }
    
}
//MARK: - UITableView Datasource, delegate
extension AlertListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "???? ????????? ??????"
        default:
            return nil
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as? AlertListCell else { return UITableViewCell()  }
        
        cell.alertSwitch.isOn = alerts[indexPath.row].isOn
        cell.timeLabel.text = alerts[indexPath.row].time
        cell.meridiemLabel.text = alerts[indexPath.row].meridiem
        
        cell.alertSwitch.tag = indexPath.row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            //?????????????????? ?????? ??????
            self.alerts.remove(at: indexPath.row)
            
            //????????? ?????? userdefaults??? ???????????? ?????? ???????????? ?????????????????? ????????? ??????
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            
            //?????? ??????
            userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[indexPath.row].id])
            self.tableView.reloadData()
            
            return
        default:
            break
            
        }
    }
    
}
