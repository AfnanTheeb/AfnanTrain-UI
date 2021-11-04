//
//  Reservation .swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 27/03/1443 AH.
//

import Foundation
class Reservation {
    //declertion Client to stor all clients reservations inside array .
    var clients: [Client] = []
    
    func deletTicketById (clientId : Int , ticketId : String){

            for (index, client) in clients.enumerated() {
                if(client.id == clientId) {
                    clients[index].deletTicket(numTicket: ticketId)
                    break
                }
            }
            
        }
    
}
