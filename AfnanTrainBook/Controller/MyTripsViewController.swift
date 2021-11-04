//
//  MyTripsViewController.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 27/03/1443 AH.
//

import UIKit

class MyTripsViewController: UIViewController {
    var reservation : Reservation!
    var clientProfile : Client?
    var clients: [Client]!

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var numTicketTextField: UITextField!
    @IBOutlet weak var IDnumClientTextField: UITextField!
    var verification = false
    override func viewWillAppear(_ animated: Bool) {
        print(reservation.clients)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func showBoutton(_ sender: Any) {
        for (index, client) in reservation.clients.enumerated() {
            if (IDnumClientTextField.text == String(client.id)) {
                verification = true
                print("User been found")
                clientProfile = client
            }
       
            
        }// end for loop
        if (verification){
            verification = false
            testLabel.text = ""
            performSegue(withIdentifier: "showClientTicketsSegue", sender: self)
        }else{
        testLabel.text = "Error, Try agin "
        }
           
                 
        
        
        
        
    }//end boutton
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showClientTicketsSegue") {
            let ticketVC = segue.destination as! TicketCellViewController
            ticketVC.reservation = reservation
            ticketVC.clientProfile = clientProfile
        }
    }
    



    }//end class
