//
//  LessonCell.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 11/12/21.
//

import UIKit

class LessonCell: UITableViewCell {
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
    func bindWithLesson(lesson: LessonItem) {
      titleLabel.text = lesson.title
      subtitleLabel.text = lesson.author
    }
    
}
