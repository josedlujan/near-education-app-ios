//
//  SnippetViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 02/12/21.
//

import UIKit
import WebKit
class SnippetViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var codeWKView: WKWebView!
    @IBOutlet weak var titleLabel: UILabel!
    var snippet:SnippetItem!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupHTML()
    }
  private func setupUI(){
    title = "Snippet"
    titleLabel.text = snippet.title
  }
    func setupHTML(){
        codeWKView.loadHTMLString(snippet.code.htmlBuilder(), baseURL: nil)
    }
}
