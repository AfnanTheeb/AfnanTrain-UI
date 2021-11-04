//
//  TicketCellTableViewController.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 27/03/1443 AH.
//

import UIKit

class TicketCellViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    var tickets: [Ticket]!
    var reservation : Reservation!
    var clientProfile : Client!
    //var arryTicket = ["Afnan","wsaif","mhammed","Ahmad"]
    @IBOutlet weak var TableTickets : UITableView!
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientProfile.tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let ticketCell = UITableViewCell(style: .default, reuseIdentifier: nil)
        ticketCell.textLabel?.text = " \(clientProfile.tickets[indexPath.row].ticketID) + from :\(clientProfile.tickets[indexPath.row].startStation) TO \(clientProfile.tickets[indexPath.row].endStation)"
  
        return ticketCell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            var findClientIndex = reservation.clients.firstIndex(where: {$0.id == Int(clientProfile.id)})
            reservation.clients[findClientIndex!].tickets.remove(at: indexPath.row)
            clientProfile.tickets.remove(at: indexPath.row)
            TableTickets.deleteRows(at: [indexPath], with: .fade)
        }
        TableTickets.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        TableTickets.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        TableTickets.delegate = self
        TableTickets.dataSource = self
    }

    
    
    
    
    
    
    // MARK: - Table view data source
    
      //  let cell = tableView.dequeueReusableCell(withIdentifier: "Afnan") as! customCell
        // Configure the cell...
        // cellProduct.title.text = item[indexPath.row].title
        
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        segue.identifier = 
        let TicketviewVC = segue.destination as! TicketViewController
    }
    
*/
}
