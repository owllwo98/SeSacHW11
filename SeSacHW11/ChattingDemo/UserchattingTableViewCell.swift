//
//  UserchattingTableViewCell.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/12/25.
//

import UIKit

class UserchattingTableViewCell: UITableViewCell {
    static let identifier = "UserchattingTableViewCell"
    
    @IBOutlet var userMessageLabel: UILabel!
    @IBOutlet var userDateLabel: UILabel!
    @IBOutlet var userMessageImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    private func configure() {
        userMessageLabel.numberOfLines = 0
        
        userMessageImageView.layer.cornerRadius = userMessageImageView.frame.width / 5
        userMessageImageView.layer.borderWidth = 0.7
        userMessageImageView.layer.borderColor = UIColor.gray.cgColor
        userMessageImageView.backgroundColor = .lightGray
        
        userMessageLabel.textColor = .black
        userMessageLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        userDateLabel.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    func configureData(_ row: Int) {
        
    }
    
    
}
