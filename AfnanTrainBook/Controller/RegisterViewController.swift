//
//  RegisterViewController.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 27/03/1443 AH.
//

import UIKit

class RegisterViewController: UIViewController {
    var reservation : Reservation!
    var ticket : Ticket!
    var client : Client!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var IDTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        IDTextField.keyboardType = .numberPad
        birthTextField.keyboardType = .numberPad
    }
    

    @IBAction func createClient(_ sender: Any) {
        var findClientIndex = reservation.clients.firstIndex(where: {$0.id == Int(IDTextField.text!)})
        if (findClientIndex != nil) {
            reservation.clients[findClientIndex!].tickets.append(ticket)
            
            client = reservation.clients[findClientIndex!]
        } else {
            if (!firstNameTextField.text!.isEmpty && !lastNameTextField.text!.isEmpty && !birthTextField.text!.isEmpty && !IDTextField.text!.isEmpty) {
                client = Client(firstName: firstNameTextField.text! , lastName: lastNameTextField.text! , birthYear: Int(birthTextField.text!)!, id: Int(IDTextField.text!)!)
                 client.tickets.append(ticket)
                reservation.clients.append(client)
            } else {
                let alert = UIAlertController(title: "Failed", message: "Check above fields", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .cancel))
present(alert, animated: true, completion: nil)
                
            }
            
        }
        
        performSegue(withIdentifier: "createClientSegue", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "createClientSegue"){
            let ticketVC = segue.destination as! TicketViewController
            ticketVC.reservation = reservation
            ticketVC.clientProfile = client
        
        }
    }
    
    

}
