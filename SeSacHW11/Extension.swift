//
//  Extension.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/9/25.
//

import UIKit


func configureTitleLabel(_ titleLabel: UILabel) {
    titleLabel.text = "UP DOWN"
    titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
    titleLabel.textAlignment = .center
}

func configureSubTitleLabel(_ subTitleLabel: UILabel,_ labelString: String) {
    subTitleLabel.text = labelString
    subTitleLabel.font = .systemFont(ofSize: 12, weight: .semibold)
    subTitleLabel.textAlignment = .center
}

func configureTitleImage(_ titleImageView: UIImageView) {
    titleImageView.image = UIImage(named: "emotion\(Int.random(in: 1...5))")
}

func configureTextField(_ textField: UITextField ) {
    let border = CALayer()
    border.frame = CGRect(x: 0, y: textField.frame.size.height - 1, width: textField.frame.width, height: 1)
    border.backgroundColor = UIColor.gray.cgColor
    
    textField.layer.addSublayer(border)
    textField.textAlignment = .center
    textField.font = .systemFont(ofSize: 20, weight: .bold)
    textField.borderStyle = .none
}

func configureStartButton(_ startButton: UIButton,_ buttonString: String) {
    startButton.setTitle(buttonString, for: .normal)
    startButton.tintColor = .white
    startButton.backgroundColor = .black
}

extension Date {
    func toDateHourString() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "HH:mm a"
        let dateString = formatter.string(from: self)
        return dateString
    }
    
    func toDateDayString() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yy.MM.dd"
        let dateString = formatter.string(from: self)
        return dateString
    }
    
    func toDayString() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "dd"
        let dateString = formatter.string(from: self)
        return dateString
    }
    
    
    
    
}

extension String {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        formatter.timeZone = TimeZone(identifier: "KST")
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()
    
    func toDate() -> Date? {
        let dateFormatter = Self.dateFormatter
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        return date
    }
}
