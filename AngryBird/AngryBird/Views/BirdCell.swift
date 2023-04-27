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
    
   
    @IBOutlet weak var birdImageView: UIImageView!
    
    var bird: Bird?{
        didSet {
            self.birdNameLabel.text = bird?.name
            self.birdDescriptionLabel.text = bird?.description
            self.accessoryType = bird!.confirmedSighting ?.checkmark : .none
            
            DispatchQueue.global(qos:.userInitiated).async {
                let imageData = NSData(contentsOf: URL(string: self.bird!.imageURL)!)
                DispatchQueue.main.async {
                    self.birdImageView.image = UIImage(data:imageData as! Data)
                    self.birdImageView.layer.cornerRadius = self.birdImageView.frame.width/2
                }
            }
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
