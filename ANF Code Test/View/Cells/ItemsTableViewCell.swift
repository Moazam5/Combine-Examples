//
//  ItemsTableViewCell.swift
//  ANF Code Test
//
//  Created by Moazam Mir on 2/15/22.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {


    @IBOutlet weak var backgroundImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func topButton(_ sender: Any) {
    }

}
