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
        // 2. 전환할 뷰컨트롤러 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "ChattingViewController") as! ChattingViewController
        
        // 값 전달 시 아웃렉 활용을 할 수 없음
        // 해당 코드가 실행되는 시점보다 아웃렛이 나중에 만들어진다
//        vc.testLabel.text = "고래밥"
        
        // 2. Pass Data - vc 가 갖고 있는 프로퍼티에 데이터 추가
//        vc.contents = mockChatList[indexPath.row]
         
        // (옵션1)
    
        vc.modalPresentationStyle = .fullScreen // 아래에서 위로 뜰 때 방식
    
        
        
        
        // 3. 화면을 전환할 방법 선택하기 - 아래에서 위로 / modal / present
        // 아래에서 위로
//        present(vc, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
