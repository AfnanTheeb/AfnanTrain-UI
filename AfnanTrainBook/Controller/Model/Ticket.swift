//
//  Ticket.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 26/03/1443 AH.
//

import Foundation
// First :
// Declaration the Enumerations - Stations && class Booking
enum Station : String {
    case Makkah
    case Jeddah         // only 4 stations of the train
    case KAEC
    case Madinah
}
//______________________________________________
// Determining the booking class / business - economy
enum BookingType : Int {
    case Economey
    case Business
}
//______________________________________________
// create struct for ticket consist information the ticket and calculate cost for it
//

struct Ticket : Equatable {
    var startStation: Station
    var endStation: Station
    var cost: Float = 0
    var bookingType: BookingType
    var status: String = "Confirmed"
    static var lastId = 0
    
    static func getNewID() -> String {
        lastId += 1
        return (String(lastId))
    }
    var ticketID : String = "AFNA-000\(getNewID())"
}
