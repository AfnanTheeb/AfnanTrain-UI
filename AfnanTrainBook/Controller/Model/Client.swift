//
//  Client.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 26/03/1443 AH.
//

import Foundation
//create struct for Client consist information the clients ..
struct Client {
    
    var firstName : String               // declertion client_Info .
    var lastName : String                //--------------------------
    var birthYear : Int
    let id : Int
    var age : Int {
        2021 - birthYear
    }
    //--------------------------------------------------
    // to stor all client reservations insaied array .
    var tickets: [Ticket] = []
    //--------------------------------------------------
    init (firstName : String , lastName : String , birthYear : Int , id : Int) {
        self.birthYear = birthYear
        self.lastName = lastName
        self.firstName = firstName
        self.id = id
        
    } // end function init
    //---------------------------------------------------
    
    
    mutating func deletTicket ( numTicket : String ){
        
        
        for (index , ticket) in self.tickets.enumerated() {
            if( ticket.ticketID == numTicket ){
                print("ticket id :\(ticket.ticketID) is deleting ..")
                self.tickets.remove(at: index)
            }
        }
    }
    
}// end struct client
