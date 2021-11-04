//
//  TicketViewController.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 27/03/1443 AH.
//

import UIKit

class TicketViewController: UIViewController {

    var clientProfile : Client!
    var reservation : Reservation!
    @IBOutlet weak var nameClientLabel: UILabel!
    @IBOutlet weak var IDClientLabel: UILabel!
    @IBOutlet weak var numTicketLabel: UILabel!
    @IBOutlet weak var fromStationLabel: UILabel!
    @IBOutlet weak var toStationLabel: UILabel!
    @IBOutlet weak var TybeLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func backToHome(_ sender: Any) {
        tabBarController?.selectedIndex = 0
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func cancelButton(_ sender: Any) {
        let findClientIndex = reservation.clients.firstIndex(where: {$0.id == clientProfile.id})
        let lastTicket = reservation.clients[findClientIndex!].tickets.last!
        let ticketIndex = reservation.clients[findClientIndex!].tickets.firstIndex(where: {$0 == lastTicket})
        reservation.clients[findClientIndex!].tickets[ticketIndex!].status = "Cancelled"
        statusLabel.text = reservation.clients[findClientIndex!].tickets.last!.status
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(clientProfile)
        nameClientLabel.text = "\(clientProfile.firstName)  \(clientProfile.lastName)"
        IDClientLabel.text = String(clientProfile.id)
        numTicketLabel.text = clientProfile.tickets.last?.ticketID
        fromStationLabel.text = clientProfile.tickets.last?.startStation.rawValue
        toStationLabel.text = clientProfile.tickets.last?.endStation.rawValue
        statusLabel.text = clientProfile.tickets.last?.status
        if (clientProfile.tickets.last?.bookingType.rawValue == 0){
            TybeLabel.text = "Economy"
        } else {
            TybeLabel.text = "Business"
        }
        costLabel.text = String(describing: clientProfile.tickets.last!.cost)
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
