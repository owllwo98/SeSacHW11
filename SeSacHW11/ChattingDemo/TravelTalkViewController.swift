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
   
    }
    

  

}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
        TravelTalkTableView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as! TravelTalkTableViewCell
        
//        for i in 0...mockChatList.count - 1 {
//            if mockChatList[i].chatroomImage.isEmpty {
//                cell.TravelTalkImageCollectionView[i].isHidden = true
//            } else {
//                for j in 0...mockChatList[i].chatroomImage.count - 1 {
//                    cell.TravelTalkImageCollectionView[i].image = UIImage(named: mockChatList[i].chatroomImage[j])
//                }
//            }
//        }
        
        print(mockChatList.count)
        print(mockChatList[0].chatroomImage[0])
        
        
        return cell
    }
    
    
}
