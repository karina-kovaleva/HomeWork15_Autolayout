//
//  ViewController.swift
//  HomeWork15_Karina
//
//  Created by Karina Kovaleva on 28.08.22.
//

import UIKit

class ViewController: UIViewController, UpdateTextDelegate, ButtonDelegate {
    let viewForButtons = ViewForButtons()
    let viewForTextFields = ViewForTextFields()
    let textView = UITextView()
  
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(viewForButtons)
        self.view.addSubview(viewForTextFields)
        self.view.addSubview(textView)
          
        viewForTextFields.updateTextDelegate = self
        viewForButtons.buttonDelegate = self
        
        viewForTextFields.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraintForViewForTextFields = NSLayoutConstraint(item: viewForTextFields, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let bottomConstraintForViewForTextFields = NSLayoutConstraint(item: viewForTextFields, attribute: .bottom, relatedBy: .equal, toItem: textView, attribute: .top, multiplier: 1, constant: -10)
        let leftConstraintForViewForTextFields = NSLayoutConstraint(item: viewForTextFields, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10)
        let topConstraintForViewForTextFields = NSLayoutConstraint(item: viewForTextFields, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 10)
        let heightConstraintForViewForTextFields  = NSLayoutConstraint(item: viewForTextFields, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        
        view.addConstraints([horizontalConstraintForViewForTextFields, bottomConstraintForViewForTextFields, leftConstraintForViewForTextFields, topConstraintForViewForTextFields, heightConstraintForViewForTextFields])
        
        viewForButtons.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraintForViewForButtons = NSLayoutConstraint(item: viewForButtons, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let bottomConstraintForViewForButtons = NSLayoutConstraint(item: viewForButtons, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        let leftConstraintForViewForButtons = NSLayoutConstraint(item: viewForButtons, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10)
        let rightConstraintForViewForButtons = NSLayoutConstraint(item: viewForButtons, attribute: .trailing, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -10)
        let topConstraintForViewForButtons = NSLayoutConstraint(item: viewForButtons, attribute: .top, relatedBy: .equal, toItem: textView, attribute: .bottom, multiplier: 1, constant: 10)
        let heightConstraintForViewForButtons = NSLayoutConstraint(item: viewForButtons, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        
        view.addConstraints([horizontalConstraintForViewForButtons, bottomConstraintForViewForButtons, rightConstraintForViewForButtons, leftConstraintForViewForButtons, topConstraintForViewForButtons, heightConstraintForViewForButtons])
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = #colorLiteral(red: 0.8255599141, green: 0.8255599141, blue: 0.8255599141, alpha: 1)
        textView.text = "Notes:"
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Times New Roman", size: 20)
        
        let horizontalConstraintForTextView = NSLayoutConstraint(item: textView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let leftConstraintForTextView = NSLayoutConstraint(item: textView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10)
        let rightConstraintForTextView = NSLayoutConstraint(item: textView, attribute: .trailing, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -10)
        let bottomConstraintForTextView = NSLayoutConstraint(item: textView, attribute: .bottom, relatedBy: .equal, toItem: viewForButtons, attribute: .top, multiplier: 1, constant: -10)
       
        view.addConstraints([horizontalConstraintForTextView, bottomConstraintForTextView, rightConstraintForTextView, leftConstraintForTextView])
        
    }
    
    func textFieldText(_ textField: UITextField) {
        if self.text != nil {
            self.text! += textField.text!
        } else {
            self.text = textField.text
        }
    }
    
    func save() {
        textView.text = self.text
    }
    
    func clear() {
        textView.text = nil
        text = nil
    }
    
    func cancel() {
        print("Cancel")
    }
}

