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
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonOne: UIButton!

    static func nib() -> UINib {
        return UINib(nibName: "FeedItemCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        buttonOne.isHidden = true
        buttonTwo.isHidden = true
        buttonOne.layer.borderColor = UIColor.black.cgColor
        buttonOne.layer.borderWidth = 1
        buttonTwo.layer.borderColor = UIColor.black.cgColor
        buttonTwo.layer.borderWidth = 1
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
            for (index,item) in content.enumerated() {
                if index == 0 {
                    buttonOne.isHidden = false
                    buttonTwo.isHidden = true
                    buttonOne.setTitle(item.title, for: .normal)
                }
                else if index == 1 {
                    buttonTwo.isHidden = false
                    buttonOne.setTitle(item.title, for: .normal)
                }
            }
        } else {
            buttonOne.isHidden = true
            buttonTwo.isHidden = true
        }
    }
}
