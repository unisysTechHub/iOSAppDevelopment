//
//  EmplistHeaderFooterView.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 23/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit
@objc protocol EmplListheadrFooterViewDeleagate {
    @objc func onExpandORCollapseTouch(icon : UIButton)
}

class EmplistHeaderFooterView: UITableViewHeaderFooterView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var delegate : EmplListheadrFooterViewDeleagate?
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
        
        
    }
    func configureContents()
    {  self.contentView.backgroundColor = .white
        // Header Label
              let headerLabel = UILabel()
              headerLabel.text = "Default header label"
        // Header Label font
        headerLabel.layoutMargins = .init(top: 4, left: 4, bottom: 4, right: 4)
        headerLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        headerLabel.adjustsFontForContentSizeCategory = true
        
        // expand Collapse button
              let icon = UIImage(named: "collapseIcon")
              let expandCollapseIcon = UIButton()
              expandCollapseIcon.tag = 0
              expandCollapseIcon.setImage(icon, for: .normal)
            
              headerLabel.translatesAutoresizingMaskIntoConstraints = false
              expandCollapseIcon.translatesAutoresizingMaskIntoConstraints = false
              contentView.addSubview(headerLabel)
              contentView.addSubview(expandCollapseIcon)
        // header label contraints
              headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
              headerLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 100).isActive = true
              
       // expandIcon contriants
              expandCollapseIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
              expandCollapseIcon.leadingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -60).isActive = true
              
                  // expand icon touchedinside
              
        expandCollapseIcon.addTarget(self.delegate, action: #selector(self.delegate?.onExpandORCollapseTouch(icon:)), for: .touchUpInside)}
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
