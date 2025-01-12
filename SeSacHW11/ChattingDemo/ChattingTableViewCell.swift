//
//  ChattingTableViewCell.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/12/25.
//

import UIKit

class ChattingTableViewCell: UITableViewCell {
    static let identifier = "ChattingTableViewCell"
    
    @IBOutlet var chatProfileImageView: UIImageView!
    @IBOutlet var chatImageView: UIImageView!
    @IBOutlet var chatProfileNameLabel: UILabel!
    @IBOutlet var chatMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        chatImageView.image = UIImage(named: "chatImage")
        configure()
        
    }
    
    private func configure() {
        chatImageView.contentMode = .scaleToFill
        chatImageView.layer.cornerRadius = chatImageView.frame.width / 5
        chatImageView.layer.borderWidth = 0.7
        chatImageView.layer.borderColor = UIColor.black.cgColor
        chatMessageLabel.numberOfLines = 0
        
        
    }
    
    func configureData(row: Int) {
        
    }
   
    
}
