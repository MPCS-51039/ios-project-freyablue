//
//  BirdCell.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/4/1.
//

import UIKit

class BirdCell: UITableViewCell {
    
    

    @IBOutlet weak var birdNameLabel: UILabel!
    
    @IBOutlet weak var birdDescriptionLabel: UILabel!
    
    var bird: Bird?{
        didSet {
            self.birdNameLabel.text = bird?.name
            self.birdDescriptionLabel.text = bird?.description
            self.accessoryType = bird!.confirmedSighting ?.checkmark : .none
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
