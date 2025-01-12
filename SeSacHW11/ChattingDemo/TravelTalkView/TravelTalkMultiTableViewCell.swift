//
//  TravelTalkMultiTableViewCell.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/12/25.
//

import UIKit

class TravelTalkMultiTableViewCell: UITableViewCell {
    static let identifier = "TravelTalkMultiTableViewCell"
    
    @IBOutlet var TravelTalkCollectionImageView: [UIImageView]!
    @IBOutlet var chatRoomNameLabel: UILabel!
    @IBOutlet var lastChatLabel: UILabel!
    @IBOutlet var chatRoomDatelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        configure()
        
    }

    private func configure() {
        for i in TravelTalkCollectionImageView {
            i.contentMode = .scaleToFill
            i.clipsToBounds = true
            i.layer.cornerRadius = i.frame.width / 2
        }
        
        chatRoomNameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        lastChatLabel.font = .systemFont(ofSize: 14, weight: .regular)
        lastChatLabel.textColor = .gray
        
        chatRoomDatelabel.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    func configureMultiData(_ row: Int ) {
        for i in 0...3 {
            TravelTalkCollectionImageView[i].image = UIImage(named: mockChatList[row].chatroomImage[i])
        }
        
        chatRoomNameLabel.text = mockChatList[row].chatroomName
        
        lastChatLabel.text = mockChatList[row].chatList.last?.message

        chatRoomDatelabel.text = mockChatList[row].chatList.last?.date.toDate()?.toDateDayString()
    }
    
}
