// 
//  CustomCellPopButton.swift
//  CustomCellValuesPopOver
//
//  Created by Yuta S. on 2019/05/19.
//  Copyright © 2019 Yuta S. All rights reserved.
//
//

import UIKit

class CustomCellPopButton: UIButton {
    
    let pullDownIconView = UIImageView(image: #imageLiteral(resourceName: "pull_down"), highlightedImage: #imageLiteral(resourceName: "pull_down_highlighted"))
    
    var cellRect: CGRect!
    
    // 角丸の半径(0で四角形)
    @IBInspectable var cornerRadius: CGFloat = 0.0
    // 枠
    @IBInspectable var borderColor: UIColor = .clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    override open var isHighlighted: Bool {
        didSet {
            self.pullDownIconView.isHighlighted = self.isHighlighted ? true : false
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // 角丸
        self.layer.cornerRadius = self.cornerRadius
        self.clipsToBounds = (self.cornerRadius > 0)
        
        // 枠線
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = self.borderWidth
        
        // プルダウンアイコン
        self.addSubview(pullDownIconView)
        pullDownIconView.translatesAutoresizingMaskIntoConstraints = false
        pullDownIconView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        pullDownIconView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        pullDownIconView.centerXAnchor.constraint (equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 10).isActive = true
        pullDownIconView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}
