//
//  String+Action.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 07/02/22.
//

import Foundation
extension String {
    func htmlBuilder() -> String {
        let htmlStart = "<HTML><HEAD><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/styles/atom-one-dark.min.css\"></HEAD><BODY style=\" font-size: 2rem; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Open Sans,Helvetica Neue,sans-serif\">"
        let htmlTemplate = "<pre><code style=\" height: 96vh; overflow: scroll; border-radius: 10px; padding: 20px; padding-right: 0;  \">\(self)</code></pre>"
        let codeBreakRegex = "!salto"
        let fullData = htmlTemplate.replacingOccurrences(of: codeBreakRegex, with:"\n", options: .regularExpression, range: nil)
        let htmlEnd = "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/highlight.min.js\"></script><script>hljs.highlightAll();</script></BODY></HTML>"
        return htmlStart + fullData + htmlEnd
    }
}
