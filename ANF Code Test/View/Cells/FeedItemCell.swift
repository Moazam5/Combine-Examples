//
//  FeedItemCell.swift
//  ANF Code Test
//
//  Created by Moazam Mir on 2/25/22.
//

import UIKit

class FeedItemCell: UITableViewCell {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var topDescription: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var promoMessage: UILabel!
    @IBOutlet var bottomDescription: UILabel!
    @IBOutlet weak var bottomStackView: UIStackView!

    static func nib() -> UINib {
        return UINib(nibName: "FeedItemCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        bottomStackView.backgroundColor = .red
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure(with data: DataModel) {
        self.backgroundImage.loadFrom(URLAddress: data.backgroundImage)
        self.topDescription.text = data.topDescription
        self.title.text = data.title
        self.promoMessage.text = data.promoMessage
        self.bottomDescription.text = data.bottomDescription

        if let content = data.content {
            for item in content {
                // make a button here and attach it to the stack view
            }
        }
        
    }
    
}
