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
    @IBOutlet var chatRoomDateLabel: UILabel!
    
    
    
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
        
        chatRoomDateLabel.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    func configureData(_ row: Int) {
        lastChatLabel.text = mockChatList[row].chatList.last?.message
        chatRoomDateLabel.text = mockChatList[row].chatList.last?.date.toDate()?.toDateDayString()
    }
    
    
}
