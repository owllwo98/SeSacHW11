//
//  UpDownGameViewController.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/9/25.
//

import UIKit

class UpDownGameViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var numberCollectionView: UICollectionView!
    
    var number: Int = 0
    var selectNumber: Int = 0
    var tryAmount: Int = 0
    var previousSelectedIndexPath: IndexPath?
    
    lazy var randomNumber: Int = Int.random(in: 1...number)
    lazy var numberArray: [Int] = Array<Int>(1...number)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTitleLabel(titleLabel)
        configureSubTitleLabel(subtitleLabel, "시도 횟수: \(tryAmount)")
        configureStartButton(startButton, "결과 확인하기")
        configurenumberCollectionViewLayout()
        
        numberCollectionView.delegate = self
        numberCollectionView.dataSource = self
        
        startButton.isEnabled = false
        startButton.backgroundColor = .lightGray
        
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        
        updateCellSelection(collectionView: numberCollectionView, newIndexPath: nil)
        
        if numberArray[selectNumber]  == randomNumber {
            titleLabel.text = "GOOD!"
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.dismiss(animated: true)
            }
        } else if numberArray[selectNumber] < randomNumber {
            titleLabel.text = "UP"
            numberArray.removeSubrange(0...selectNumber)
            startButton.isEnabled = false
            startButton.backgroundColor = .lightGray
            numberCollectionView.reloadData()
        } else if numberArray[selectNumber] > randomNumber {
            titleLabel.text = "DOWN"
            numberArray.removeSubrange(selectNumber...)
            startButton.isEnabled = false
            startButton.backgroundColor = .lightGray
            numberCollectionView.reloadData()
        } else {
            
        }
        
        tryAmount += 1
        configureSubTitleLabel(subtitleLabel, "시도 횟수: \(tryAmount)")
    }
    
}



// MARK: CollectionView
extension UpDownGameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let xib = UINib(nibName: UpDownCollectionViewCell.identifier, bundle: nil)
        numberCollectionView.register(xib, forCellWithReuseIdentifier: UpDownCollectionViewCell.identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpDownCollectionViewCell.identifier, for: indexPath) as! UpDownCollectionViewCell
        
        cell.numberLabel.text = "\(numberArray[indexPath.item])"
        
        
        
        DispatchQueue.main.async {
            cell.backgroundImageView.layer.cornerRadius = cell.backgroundImageView.frame.width / 2
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(randomNumber)
        selectNumber = indexPath.item
        print(selectNumber)
        
        updateCellSelection(collectionView: collectionView, newIndexPath: indexPath)
        
        startButton.isEnabled = true
        startButton.backgroundColor = .black
        
        
    }
    
    func updateCellSelection(collectionView: UICollectionView, newIndexPath: IndexPath?) {
    
        if let previousIndexPath = previousSelectedIndexPath, let previousCell = collectionView.cellForItem(at: previousIndexPath) as? UpDownCollectionViewCell {
            previousCell.backgroundImageView.backgroundColor = .white
            previousCell.numberLabel.textColor = .black
        }
  
        if let newIndexPath = newIndexPath, let newCell = collectionView.cellForItem(at: newIndexPath) as? UpDownCollectionViewCell {
            newCell.backgroundImageView.backgroundColor = .black
            newCell.numberLabel.textColor = .white
        }

        previousSelectedIndexPath = newIndexPath
    }
}

// MARK: CollectionView  layout
extension UpDownGameViewController {
    
    func configurenumberCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        
        let sectionInset: CGFloat = 4
        let cellSpacing: CGFloat = 4
        
        
        layout.scrollDirection = .horizontal
        
        let deviceWidth =  numberCollectionView.frame.width
        let cellWidth = deviceWidth - (sectionInset * 2) - (cellSpacing * 5)
        
        layout.itemSize = CGSize(width: cellWidth / 6, height: cellWidth / 6)
        layout.sectionInset = UIEdgeInsets(top: sectionInset * 2, left: sectionInset , bottom: sectionInset * 2, right: sectionInset )
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        numberCollectionView.isPagingEnabled = true
        numberCollectionView.collectionViewLayout = layout
    }
}
