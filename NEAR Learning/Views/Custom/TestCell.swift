//
//  TestCell.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 02/12/21.
//

import UIKit

class TestCell: UITableViewCell {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var categoryImage: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
      self.containerView.shadow()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func bindWithCategory(category: CategoryItem) {
    titleLabel.text = category.name
    guard let url = URL(string: category.photo) else {return}
    categoryImage.af.setImage(withURL: url)
  }
  
}
