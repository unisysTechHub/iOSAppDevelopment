//
//  RatingControl.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 06/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var startSize : CGSize = CGSize(width: 44, height: 44)
    {
        didSet{
            setUpButtons()
        }
    }
    @IBInspectable var starCount: Int = 5
        {
        didSet{
            setUpButtons()
        }
    }
    
    var rating : Int = 0
    {
        didSet
        {
            ratingFilledStars()
        }
    }
    
    var ratingButtons = [UIButton]()
    override init(frame: CGRect) {
        super.init(frame : frame)
        setUpButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()
    }
    @objc func ratingButtonTapped(button : UIButton)
    {
        print("Button pressed")
        guard let index = ratingButtons.index(of: button)
            else {
                print("the button is not in ratingButtons")
                return
        }
        
        let nextIndex = index + 1;
        
        
        for i in 0..<ratingButtons.count
        {
            if i < nextIndex {
               ratingButtons[i].isSelected = true

            }
            else
            {
                ratingButtons[i].isSelected = false
            }
            
        }
        
        
    }
    
    func ratingFilledStars()
    {
        for i in 0..<rating
        {
            ratingButtons[i].isSelected = true
        }
        
    }
    
    
   func  setUpButtons()
    {
        
        let bundle = Bundle(for: type(of: self))
        
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        
        for button in ratingButtons
        {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        for i in 0..<starCount
        {
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted,.selected])

            addButton( i,button: button)
        }
   
        
    }
    
    func addButton(_ index : Int, button : UIButton)
    {
        
                  button.backgroundColor = .red
                  button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: startSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: startSize.width).isActive = true
                  button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        button.tag = index
                 
       self.addArrangedSubview(button)
        ratingButtons.append(button)
    }
}
