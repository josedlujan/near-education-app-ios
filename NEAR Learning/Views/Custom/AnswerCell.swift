//
//  AnswerCell.swift
//  NEAR Learning
//
//  Created by Isaac R on 04/02/22.
//

import UIKit

protocol AnswerCellDelegate: AnyObject {
  func answer(section: Int, answer: String)
}

class AnswerCell: UITableViewCell {
  @IBOutlet weak var collectionView: UICollectionView!
  var answers: [String] = []
  var answersTemp: [AnswerDisplay] = []
  var section: IndexPath!

  weak var delegate: AnswerCellDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UINib(nibName: "SelectedAnswerCell", bundle: nil),
                            forCellWithReuseIdentifier: "SelectedAnswerCell")
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func bindWithAnswers(questions: [QuestionItem], indexPath: IndexPath, answerTemp: [AnswerDisplay]) {
    self.answers = questions[indexPath.section].answers
    self.section = indexPath
    self.answersTemp = answerTemp
    collectionView.reloadData()
  }

}

extension AnswerCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return answers.count
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedAnswerCell",
                                                        for: indexPath) as? SelectedAnswerCell else {fatalError("")}
    let answer = answers[indexPath.row]
    cell.bindWithtAnswer(answer: answer, indexPath: section, type: answersTemp)
    return cell
  }

  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let answer = answers[indexPath.row]
    delegate?.answer(section: section.section, answer: answer)
  }
}

extension AnswerCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let screenSize = collectionView.bounds// UIScreen.main.bounds
    let height = screenSize.width
    return CGSize(width: height, height: 50)
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}


struct AnswerDisplay {
  let index: Int
  let answer: String
}
