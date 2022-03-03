//
//  QuestionCell.swift
//  NEAR Learning
//
//  Created by Isaac R on 05/02/22.
//

import UIKit

class QuestionCell: UITableViewCell {
  @IBOutlet weak var questionLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  func bindWithQuestion(question: String) {
    questionLabel.text = question
  }
}
