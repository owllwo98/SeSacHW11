//
//  StartGameViewController.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/9/25.
//

import UIKit

class StartGameViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var titleImageView: UIImageView!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTitleImage(titleImageView)
        configureTitleLabel(titleLabel)
        configureSubTitleLabel(subTitleLabel, "GAME")
        configureStartButton(startButton, "시작하기")
        configureTextField(numberTextField)
        
    }

    @IBAction func endEditingTextField(_ sender: UITextField) {
        
    }
    
    @IBAction func gameStartButton(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "UpDownGameViewController") as! UpDownGameViewController
        
        vc.modalPresentationStyle = .fullScreen
        
        guard let gameNumber = numberTextField.text else {
            return
        }
        
        guard let intGameNumber = Int(gameNumber) else {
            return
        }
        
        vc.number = intGameNumber
        
        present(vc, animated: true)
    }
    
    @IBAction func returnButtonTapped(_ sender: UITextField) {
    }
}

