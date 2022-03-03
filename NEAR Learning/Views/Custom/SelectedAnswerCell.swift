//
//  SelectedAnswerCell.swift
//  NEAR Learning
//
//  Created by Isaac R on 04/02/22.
//

import UIKit

class SelectedAnswerCell: UICollectionViewCell {
  @IBOutlet weak var answerLabel: UILabel!
  @IBOutlet weak var answerImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  

  func bindWithtAnswer(answer: String, indexPath: IndexPath, type: [AnswerDisplay]) {
    answerLabel.text = answer
    validateAnswer(type: type, answer: answer, section: indexPath.section)
  }

  
  func validateAnswer(type: [AnswerDisplay], answer: String, section : Int ) {
    if type.contains(where: {$0.answer == answer && $0.index == section}) {
      answerImage.image = UIImage(named: "icnCircleOn")
      answerLabel.textColor = .gray
    } else {
      answerImage.image = UIImage(named: "icnCircleOff")
      answerLabel.textColor = UIColor(named: "TextGeneralColor")
    }
  }

}
