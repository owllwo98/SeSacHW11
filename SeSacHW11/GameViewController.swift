//
//  GameViewController.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/8/25.
//

import UIKit

class GameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var numberTextView: UITextView!
    @IBOutlet var resultLabel: UILabel!
    
    let pickerView = UIPickerView()
    var array: [Int] = Array<Int> (1...100).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        titleLabelConfigure()
        numberTextFieldConfigure()
        numberTextVieConfigure()
        resultLabelConfigure()
        
        print(array.count)
        
    }
    
    func titleLabelConfigure() {
        titleLabel.text = "369 게임"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
    }
    
    func numberTextFieldConfigure() {
        numberTextField.placeholder = "최대 숫자를 입력해주세요"
        numberTextField.textAlignment = .center
        numberTextField.inputView = pickerView
    }
    
    func numberTextVieConfigure() {
        numberTextView.text = ""
        numberTextView.isEditable = false
    }
    
    func resultLabelConfigure() {
        resultLabel.font = .systemFont(ofSize: 28, weight: .bold)
        resultLabel.numberOfLines = 3
        resultLabel.textAlignment = .center
        resultLabel.text = ""
    }
    
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(array[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let newArray: [Int] = Array<Int> (1...array[row])
        let stringArray = newArray.map { String($0) }.joined(separator: ", ")
        var upArray: [String] = []
        var newArr: [Array<Character>] = []
        var amount: Int = 0
        
        
        for i in 0..<newArray.count {
            upArray.append(String(format: "%02d", newArray[i]))
            let arr = Array(upArray[i])
            print(arr)
            if arr.contains("3") || arr.contains("6") || arr.contains("9") {
                newArr.append(arr)
            }
            amount += arr.filter { $0 == "3" || $0 == "6" || $0 == "9" }.count
        }
        
        
        resultLabel.text = "숫자 \(newArray.count)까지 총 박수는 \(amount)번 입니다."
        numberTextView.text = stringArray
        
      
    }
    
    
    
    
    
    

    

}
