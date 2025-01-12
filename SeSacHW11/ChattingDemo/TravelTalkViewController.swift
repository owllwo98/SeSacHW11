//
//  TravelTalkViewController.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/11/25.
//

import UIKit

class TravelTalkViewController: UIViewController {
    @IBOutlet var TravelTalkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TravelTalkTableView.dataSource = self
        TravelTalkTableView.delegate = self
        
        TravelTalkTableView.separatorStyle = .none
        
        navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "back"), style: .plain, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .black
    }

}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        
        
        if mockChatList[row].chatroomImage.count == 4 {
            let multiXib = UINib(nibName: TravelTalkMultiTableViewCell.identifier, bundle: nil)
            TravelTalkTableView.register(multiXib, forCellReuseIdentifier: TravelTalkMultiTableViewCell.identifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkMultiTableViewCell.identifier, for: indexPath) as! TravelTalkMultiTableViewCell
            
            cell.configureMultiData(row)
            return cell
        } else {
            let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
            TravelTalkTableView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as! TravelTalkTableViewCell
            
            cell.TravelTalkImageView.image = UIImage(named: mockChatList[row].chatroomImage[0])
            cell.chatRoomNameLabel.text = mockChatList[row].chatroomName
            cell.configureData(row)
        
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Chatting", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ChattingViewController") as! ChattingViewController

        vc.contents = mockChatList[indexPath.row].chatroomName
        vc.index = indexPath.row
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
