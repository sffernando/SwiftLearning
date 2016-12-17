//
//  RatingControl.swift
//  FoodTracker
//
//  Created by koudai on 2016/11/28.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    // MARK: Initilization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        let emptyStarImage = UIImage.init(named: "emptyStar")
        let filledStarImage = UIImage.init(named: "filledStar")
        
        for _ in 0..<starCount {
            let button = UIButton()
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])
            button.adjustsImageWhenHighlighted = false
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(RatingControl.rationgButtonTapped(button:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = (Int)(frame.size.height)
        
        var buttonFrame = CGRect.init(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    override var intrinsicContentSize: CGSize {
        let buttonSize = (Int)(frame.size.height)
        let width = buttonSize + (buttonSize + spacing) * (starCount - 1)
        return CGSize.init(width: width, height: 40)
    }
    
    // MARK: Button Action
    func rationgButtonTapped(button: UIButton) {
        rating = ratingButtons.index(of: button)! + 1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
}
