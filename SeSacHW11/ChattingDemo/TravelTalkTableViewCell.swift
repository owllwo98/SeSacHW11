//
//  TravelTalkTableViewCell.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/11/25.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {
    static let identifier = "TravelTalkTableViewCell"
    
    @IBOutlet var TravelTalkImageView: UIImageView!
    @IBOutlet var chatRoomNameLabel: UILabel!
    @IBOutlet var lastChatLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
        
    }
    
    private func configure() {
        TravelTalkImageView.contentMode = .scaleToFill
        TravelTalkImageView.clipsToBounds = true
        TravelTalkImageView.layer.cornerRadius = TravelTalkImageView.frame.width / 2
        
        chatRoomNameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        lastChatLabel.font = .systemFont(ofSize: 14, weight: .regular)
        lastChatLabel.textColor = .gray
    }
    
    func configureData(_ row: Int) {
        lastChatLabel.text = mockChatList[row].chatList.last?.message
    }
    
    
}
