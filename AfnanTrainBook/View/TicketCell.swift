//
//  TicketCell.swift
//  AfnanTrainBook
//
//  Created by Afnan Theb on 28/03/1443 AH.
//

import UIKit

class TicketCell: UITableViewCell {
    

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var deceLabel: UILabel!
    
    
    @IBOutlet weak var typeLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
