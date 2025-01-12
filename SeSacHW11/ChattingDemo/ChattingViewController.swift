//
//  ChattingViewController.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/12/25.
//

import UIKit

class ChattingViewController: UIViewController {
    
    @IBOutlet var chattingTableView: UITableView!
    var contents: String?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chattingTableView.separatorStyle = .none
        navigationItem.title = contents
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        
        let xib = UINib(nibName: ChattingTableViewCell.identifier, bundle: nil)
        chattingTableView.register(xib, forCellReuseIdentifier: ChattingTableViewCell.identifier)
        
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList[index ?? 0].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChattingTableViewCell.identifier, for: indexPath) as! ChattingTableViewCell
        
        cell.configureData(row: index ?? 0)
        cell.chatProfileImageView.image = UIImage(named: mockChatList[index ?? 0].chatList[indexPath.row].user.rawValue)
        cell.chatMessageLabel.text = mockChatList[index ?? 0].chatList[indexPath.row].message
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
