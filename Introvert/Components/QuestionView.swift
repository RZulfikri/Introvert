//
//  QuestionView.swift
//  Introvert
//
//  Created by Rahmat Zulfikri on 06/03/20.
//  Copyright © 2020 Rahmat Zulfikri. All rights reserved.
//

import UIKit

@IBDesignable class QuestionView: UIView {
    @IBOutlet weak var labelQuestion: UILabel!
    let nibName = "QuestionView"
    
    @IBInspectable var question: String {
         get {
             return labelQuestion.text ?? ""
         }
         set(question) {
             labelQuestion.text = question
         }
     }
    
    @IBInspectable var questionBackground: UIColor? {
          get {
            return labelQuestion.backgroundColor
          }
          set(questionBackground) {
            let color = questionBackground ?? UIColor(ciColor: .white)
            labelQuestion.backgroundColor = color
          }
      }
    
    @IBInspectable var questionClor: UIColor? {
           get {
             return labelQuestion.textColor
           }
           set(questionBackground) {
             let color = questionBackground ?? UIColor(ciColor: .white)
             labelQuestion.textColor = color
           }
      }
    
  

    var view: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
