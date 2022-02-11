//
//  PathCell.swift
//  NEAR Learning
//
//  Created by Isaac R on 10/02/22.
//

import UIKit

class PathCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  func bindWithPath(pathCategory: PathCategoryItem){
    titleLabel.text = pathCategory.title
  }
}
