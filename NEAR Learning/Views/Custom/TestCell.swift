//
//  TestCell.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 02/12/21.
//

import UIKit

class TestCell: UITableViewCell {
  @IBOutlet weak var containerView: UIView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      self.containerView.shadow()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
