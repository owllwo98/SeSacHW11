//
//  ChattingViewController.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/12/25.
//

import UIKit

class ChattingViewController: UIViewController {
    
    @IBOutlet var chattingTableView: UITableView!
    @IBOutlet var chattingTextField: UITextField!
    
    var contents: String?
    var index: Int?
    var list: [ChatRoom] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chattingTableView.separatorStyle = .none
        navigationItem.title = contents
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        
        let xib = UINib(nibName: ChattingTableViewCell.identifier, bundle: nil)
        chattingTableView.register(xib, forCellReuseIdentifier: ChattingTableViewCell.identifier)
        
        let userXib = UINib(nibName: UserchattingTableViewCell.identifier, bundle: nil)
        chattingTableView.register(userXib, forCellReuseIdentifier: UserchattingTableViewCell.identifier)
        
        let dayXib = UINib(nibName: ChangeDayTableViewCell.identifier, bundle: nil)
        chattingTableView.register(dayXib, forCellReuseIdentifier: ChangeDayTableViewCell.identifier)
        
        chattingTextField.placeholder = "메세지를 입력하세요"
        chattingTextField.rightViewMode = .always
        chattingTextField.rightView = UIImageView(image: UIImage(systemName: "paperplane"))
        chattingTextField.rightView?.tintColor = .lightGray
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[index ?? 0].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChattingTableViewCell.identifier, for: indexPath) as! ChattingTableViewCell
        
        let userCell = tableView.dequeueReusableCell(withIdentifier: UserchattingTableViewCell.identifier, for: indexPath) as! UserchattingTableViewCell
        
//        let dayCell = tableView.dequeueReusableCell(withIdentifier: ChangeDayTableViewCell.identifier, for: indexPath) as! ChangeDayTableViewCell
//        
//        let calendar = Calendar.current
        
        if list[index ?? 0].chatList[indexPath.row].user.rawValue == "user" {
            userCell.userMessageLabel.text = list[index ?? 0].chatList[indexPath.row].message
            userCell.userDateLabel.text = list[index ?? 0].chatList[indexPath.row].date.toDate()?.toDateHourString()
            return userCell
        } else {
            cell.configureData(row: index ?? 0)
            cell.chatProfileImageView.image = UIImage(named: list[index ?? 0].chatList[indexPath.row].user.rawValue)
            cell.chatMessageLabel.text = list[index ?? 0].chatList[indexPath.row].message
            cell.chatProfileNameLabel.text = list[index ?? 0].chatList[indexPath.row].user.rawValue
            cell.chatDateLabel.text = list[index ?? 0].chatList[indexPath.row].date.toDate()?.toDateHourString()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

