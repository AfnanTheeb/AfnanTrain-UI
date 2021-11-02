//
//  RegisterViewController.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 27/03/1443 AH.
//

import UIKit

class RegisterViewController: UIViewController {
    var ticket : Ticket!
    var client : Client!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var IDTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(ticket)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func createClient(_ sender: Any) {
        client = Client(firstName: firstNameTextField.text! , lastName: lastNameTextField.text! , birthYear: Int(birthTextField.text!)!, id: Int(IDTextField.text!)!)
        client.tickets.append(ticket)
        performSegue(withIdentifier: "createClientSegue", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "createClientSegue"){
            let ticketVC = segue.destination as! TicketViewController
            
            ticketVC.client = client
        }
    }
    

}
