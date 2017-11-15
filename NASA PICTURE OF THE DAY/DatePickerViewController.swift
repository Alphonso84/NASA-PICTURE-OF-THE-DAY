//
//  DatePickerView.swift
//  NASA PICTURE OF THE DAY
//
//  Created by user on 11/14/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//
import UIKit



class DatePickerViewController: UIViewController {
    @IBOutlet weak var dateSelector: UIDatePicker!
    
    @IBAction func datePickerDate(_ sender: Any, forEvent event: UIEvent) {
    }
    override func viewDidLoad() {
        var selectedDate = string(dateSelector.date)
    
    @IBAction func getPhotoButton(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "POTDViewController")
        
    }
    }
    
}
