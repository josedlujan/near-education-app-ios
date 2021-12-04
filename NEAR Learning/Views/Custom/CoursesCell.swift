//
//  CoursesCell.swift
//  NEAR Learning
//
//  Created by Isaac R on 27/11/21.
//

import UIKit

class CoursesCell: UITableViewCell {
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
