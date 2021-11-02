//
//  TicketViewController.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 27/03/1443 AH.
//

import UIKit

class TicketViewController: UIViewController {

    var client : Client!
    
    @IBOutlet weak var nameClientLabel: UILabel!
    @IBOutlet weak var IDClientLabel: UILabel!
    @IBOutlet weak var numTicketLabel: UILabel!
    @IBOutlet weak var fromStationLabel: UILabel!
    @IBOutlet weak var toStationLabel: UILabel!
    @IBOutlet weak var TybeLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     print(client)
        nameClientLabel.text = client.firstName + client.lastName
        IDClientLabel.text = String(client.id)
        numTicketLabel.text = client.tickets.last?.ticketID
        fromStationLabel.text = client.tickets.last?.startStation.rawValue
        toStationLabel.text = client.tickets.last?.endStation.rawValue
        TybeLabel.text = String(describing: client.tickets.last?.bookingType.rawValue)
        costLabel.text = String(describing: client.tickets.last?.cost)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//     func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
