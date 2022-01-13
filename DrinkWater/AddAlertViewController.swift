//
//  AddAlertViewController.swift
//  DrinkWater
//
//  Created by Terry on 2022/01/13.
//

import UIKit

class AddAlertViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    var pickedDate: ((_ date: Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func dismissButtontapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
}
