//
//  BookingViewController.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 26/03/1443 AH.
//

import UIKit

class BookingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var toPicker: UIPickerView!
    
 
    @IBOutlet weak var setmentClass: UISegmentedControl!
    
    var fromStations = ["Makkah", "Jeddah", "KAEC" , "Madinah"]
    var toStations = ["Makkah", "Jeddah", "KAEC" , "Madinah"]
    var fromSelected , toSelected : String!
    var typeSelected : Int!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == fromPicker {
            return fromStations.count
        } else {
            return toStations.count
        }
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == fromPicker {
            return fromStations[row]
        } else {
            return toStations[row]
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if( pickerView == fromPicker){
            toStations = fromStations.filter({$0 != fromStations[row]})
            fromSelected = fromStations[row]
            toPicker.isHidden = false
        } else {
            toSelected = toStations[row]

        }
        fromPicker.reloadAllComponents()
        toPicker.reloadAllComponents()

    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        fromPicker.delegate = self
        fromPicker.dataSource = self
        
        toPicker.delegate = self
        toPicker.dataSource = self
        
        typeSelected = 0
        toPicker.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onChange(_ sender: Any) {
        print (setmentClass.selectedSegmentIndex)
        typeSelected = setmentClass.selectedSegmentIndex
    }
    
    func calculateTicketPrice(from: String, to: String, ticketType: Int = 0 ) -> Ticket {
        let enumFromSelected = Station(rawValue: from)
        let enumToSelected = Station(rawValue: to)
        let enumTicketType = BookingType(rawValue: ticketType)
        return Ticket(startStation: enumFromSelected!, endStation: enumToSelected!, bookingType: enumTicketType!)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue.identifier
//        segue.destination
        if (segue.identifier == "createTicketSegue"){
            let ticketVC = segue.destination as! RegisterViewController
            
            ticketVC.ticket = calculateTicketPrice(from: fromSelected, to: toSelected, ticketType: typeSelected)
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

