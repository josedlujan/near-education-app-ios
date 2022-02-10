//
//  LevelCell.swift
//  NEAR Learning
//
//  Created by Isaac R on 05/02/22.
//

import UIKit

class LevelCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var rigthLabel: UILabel!
  @IBOutlet weak var failLabel: UILabel!
  @IBOutlet weak var stkEvaluation: UIStackView!
  let session = UserSession.sharedInstance
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
  
  func bindWithLevel(level: LevelItem){
    titleLabel.text = "Nivel: \(level.levelNumber)"
    subtitleLabel.text = "Nivel: " + level.levelDescription
    
    guard let email = session.sessionData.email else {return}
    stkEvaluation.isHidden = true
    QuestionBO.getAnswers(idCategory: level.idCategory, userMail: email){[weak self] answers,isError in
      if !isError {
        guard let result = answers.filter({$0.idCategory == level.idCategory && $0.idLevel == level.id}).first else {return}
        self?.failLabel.text = String(result.failAnswers)
        self?.rigthLabel.text = String(result.rigthAnswers)
        self?.stkEvaluation.isHidden = false
      } else{
        debugPrint("No se encontraron respuestas")
      }
    }
  }
    
    func bindWithSnippet(snippet:SnippetItem){
        titleLabel.text = snippet.title
        subtitleLabel.text = ""
    }
}
