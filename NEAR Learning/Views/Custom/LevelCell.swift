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
  }
    
}
