//
//  ViewForButtons.swift
//  HomeWork15_Karina
//
//  Created by Karina Kovaleva on 30.08.22.
//

import UIKit

protocol ButtonDelegate: AnyObject {
    func save()
    func clear()
    func cancel()
}

class ViewForButtons: UIView {
    
    weak var buttonDelegate: ButtonDelegate?
    
    let saveButton = UIButton()
    let cancelButton = UIButton()
    let clearButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(saveButton)
        addSubview(clearButton)
        addSubview(cancelButton)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        saveButton.setTitle("Save", for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
        clearButton.setTitle("Clear", for: .normal)
 
        saveButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        clearButton.setTitleColor(.systemBlue, for: .normal)
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        let horizontalConstraintForCancelButton = NSLayoutConstraint(item: cancelButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let verticalConstraintForCancelButton = NSLayoutConstraint(item: cancelButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let verticalConstraintForClearButton = NSLayoutConstraint(item: clearButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let verticalConstraintForSaveButton = NSLayoutConstraint(item: saveButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let leftConstraintForSaveButton = NSLayoutConstraint(item: saveButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 40)
        let rightConstraintForClearButton = NSLayoutConstraint(item: clearButton, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -40)
   
        self.addConstraints([horizontalConstraintForCancelButton, verticalConstraintForCancelButton, verticalConstraintForSaveButton, verticalConstraintForClearButton, leftConstraintForSaveButton, rightConstraintForClearButton])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func saveButtonTapped() {
        buttonDelegate?.save()
    }
    
    @objc func clearButtonTapped() {
        buttonDelegate?.clear()
    }
    
    @objc func cancelButtonTapped() {
        buttonDelegate?.cancel()
    }
}
