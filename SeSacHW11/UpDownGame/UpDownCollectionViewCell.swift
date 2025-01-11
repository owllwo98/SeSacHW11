//
//  UpDownCollectionViewCell.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/9/25.
//

import UIKit

class UpDownCollectionViewCell: UICollectionViewCell {
    static let identifier = "UpDownCollectionViewCell"
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundImageView.backgroundColor = .white
    }

}
