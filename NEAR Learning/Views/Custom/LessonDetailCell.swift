//
//  LessonDetailCell.swift
//  NEAR Learning
//
//  Created by Isaac R on 08/02/22.
//

import UIKit

class LessonDetailCell: UITableViewCell {
  @IBOutlet weak var lessonImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var articleLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
  func bindWithLesson(lesson: LessonItem){
    authorLabel.text = lesson.author
    titleLabel.text = lesson.title
    dateLabel.text = "- " + lesson.date
    articleLabel.text = lesson.article
    guard let imageUrl = URL(string: lesson.photo) else {return}
    lessonImage.af.setImage(withURL: imageUrl)
  }
}
