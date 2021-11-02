//
//  BookingViewController.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 26/03/1443 AH.
//

import UIKit

class BookingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var stations = ["Makkah", "Jeddah", "KAEC" , "Madinah"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == fromPicker {
            return stations.count
        } else {
            return stations.count
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == fromPicker {
            return stations[row]
        } else {
            return stations[row]
        }
        
    }


    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var toPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fromPicker.delegate = self
        fromPicker.dataSource = self
        toPicker.delegate = self
        toPicker.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
