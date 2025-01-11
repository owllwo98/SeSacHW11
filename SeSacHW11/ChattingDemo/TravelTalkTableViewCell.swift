//
//  TravelTalkTableViewCell.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/11/25.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {
    static let identifier = "TravelTalkTableViewCell"
    
    @IBOutlet var TravelTalkImageCollectionView: [UIImageView]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
