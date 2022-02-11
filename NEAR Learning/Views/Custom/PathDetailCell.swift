//
//  PathDetailCell.swift
//  NEAR Learning
//
//  Created by Isaac R on 10/02/22.
//

import UIKit

protocol PathDetailDelegate: AnyObject {
  func goCourse(url: String)
}
class PathDetailCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var lifeTimeLabel: UILabel!
  @IBOutlet weak var levelLabel: UILabel!
  @IBOutlet weak var difficultyLabel: UILabel!
  @IBOutlet weak var requirementsLabel: UILabel!
  @IBOutlet weak var stkRequirements: UIStackView!
  weak var delegate: PathDetailDelegate?
  var url: String = ""
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
  func bindWithPath(path: PathItem) {
    titleLabel.text = path.title
    descriptionLabel.text = path.description
    levelLabel.text = path.level
    difficultyLabel.text = path.difficulty
    lifeTimeLabel.text = path.lifeTime
    url = path.url
    var requirements = path.requirements
    if requirements.isEmpty {
      stkRequirements.isHidden = true
    } else {
      stkRequirements.isHidden = false
      requirements.insert("", at: 0)
      let new = requirements.joined(separator: "\n・ ")
      requirementsLabel.text = new
    }
  }
  
  @IBAction func takeAction(_ sender: UIButton) {
    delegate?.goCourse(url: url)
  }
  
}
