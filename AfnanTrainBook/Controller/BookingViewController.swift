//
//  BookingViewController.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 26/03/1443 AH.
//

import UIKit

class BookingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var reservation : Reservation!
    
    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var toPicker: UIPickerView!
    @IBOutlet weak var setmentClass: UISegmentedControl!
    
    var fromStations = ["Makkah", "Jeddah", "KAEC" , "Madinah"]
    var toStations = ["Makkah", "Jeddah", "KAEC" , "Madinah"]
    var fromSelected , toSelected : Station!
    var typeSelected : Int!
    var ticket : Ticket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromPicker.delegate = self
        fromPicker.dataSource = self
        
        toPicker.delegate = self
        toPicker.dataSource = self
        
        typeSelected = 0
        toPicker.isHidden = true
        fromSelected = .Makkah
        toSelected = .Jeddah
        fromPicker.selectRow(0, inComponent: 0, animated: true)
        toPicker.selectRow(1, inComponent: 0, animated: true)
        ticket = issueTicketPrice(from: .Makkah, to: .Jeddah, ticketType: 0 )
        // Do any additional setup after loading the view.
    }
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
            fromSelected = Station(rawValue: fromStations[row])
            ticket.startStation = fromSelected
            updateTicketPrice()
            toPicker.isHidden = false
            
        } else {
            toSelected = Station(rawValue: toStations[row])

        }
//        updatePriceTicket()
        fromPicker.reloadAllComponents()
        toPicker.reloadAllComponents()

    }
    

    
    @IBAction func onChange(_ sender: Any) {
        print (setmentClass.selectedSegmentIndex)
        typeSelected = setmentClass.selectedSegmentIndex
//        updatePriceTicket()

    }
    func updateTicketPrice() {
        

    }

    
    func issueTicketPrice(from: Station = .Makkah, to: Station = .Jeddah, ticketType: Int = 0 ) -> Ticket {
        let enumFromSelected : Station = from
        let enumToSelected : Station =  to
        let enumTicketType = BookingType(rawValue: ticketType)
        return Ticket(startStation: enumFromSelected, endStation: enumToSelected, cost: 40, bookingType: enumTicketType!)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue.identifier
//        segue.destination
        if (segue.identifier == "createTicketSegue"){
            let ticketVC = segue.destination as! RegisterViewController
            ticketVC.reservation = reservation

            ticketVC.ticket = ticket
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

