//
//  SnippetViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 02/12/21.
//

import UIKit

class SnippetViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var snippetCodeTextView: UITextView!
    var snippet:SnippetItem!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
  private func setupUI(){
    title = "Snippet"
      titleLabel.text = snippet.title
      snippetCodeTextView.text = snippet.code
  }
}
