//
//  NewCell.swift
//  NEAR Learning
//
//  Created by Isaac R on 30/01/22.
//

import UIKit
import AlamofireImage

class NewCell: UITableViewCell {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var newImage: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    //containerView.shadowAndRound(radius: 20)
    //containerView.roundConers(radius: 20, corner: .allCorners)
    containerView.setShadow()
    newImage.roundConers(radius: 20, corner: .allCorners)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
  func bindWithNew(new: NewsItem) {
    titleLabel.text = new.title
    dateLabel.text = new.date
    descriptionLabel.text = new.resumen
    guard let url = URL(string: new.photo) else {return}
    newImage.af.setImage(withURL: url)
  }
}
