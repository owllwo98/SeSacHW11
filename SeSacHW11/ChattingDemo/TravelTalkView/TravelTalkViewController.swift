//
//  TravelTalkViewController.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/11/25.
//

import UIKit

class TravelTalkViewController: UIViewController {
    @IBOutlet var TravelTalkTableView: UITableView!
    @IBOutlet var TravelTalkTextField: UITextField!
    
    lazy var list: [ChatRoom] = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TravelTalkTableView.dataSource = self
        TravelTalkTableView.delegate = self
        
        TravelTalkTableView.separatorStyle = .none
        
        navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "back"), style: .plain, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .black
        
        TravelTalkTextField.placeholder = "친구 이름을 검색해보세요"
        TravelTalkTextField.leftViewMode = .always
        TravelTalkTextField.leftView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        TravelTalkTextField.leftView?.tintColor = .gray
        
    }
 
    @IBAction func textChanged(_ sender: UITextField) {
        var result: [ChatRoom] = []
        let trimText = sender.text?.trimmingCharacters(in: .whitespaces)
        
        if trimText == "" {
            result = mockChatList
        } else {
            result = mockChatList.filter {
                $0.chatList.contains {
                    $0.user.rawValue.uppercased() == trimText?.uppercased()
                }
            }
        }
        
        list = result
        TravelTalkTableView.reloadData()
    }
}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        
        
        if list[row].chatroomImage.count == 4 {
            let multiXib = UINib(nibName: TravelTalkMultiTableViewCell.identifier, bundle: nil)
            TravelTalkTableView.register(multiXib, forCellReuseIdentifier: TravelTalkMultiTableViewCell.identifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkMultiTableViewCell.identifier, for: indexPath) as! TravelTalkMultiTableViewCell
            
            cell.configureMultiData(row)
            return cell
        } else {
            let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
            TravelTalkTableView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as! TravelTalkTableViewCell
            
            cell.TravelTalkImageView.image = UIImage(named: list[row].chatroomImage[0])
            cell.chatRoomNameLabel.text = list[row].chatroomName
            cell.configureData(row)
        
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Chatting", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ChattingViewController") as! ChattingViewController

        vc.contents = list[indexPath.row].chatroomName
        vc.list = list
        vc.index = indexPath.row
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
