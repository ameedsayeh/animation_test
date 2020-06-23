//
//  FooterCell.swift
//  Animation Test
//
//  Created by Ameed Sayeh on 6/15/20.
//  Copyright © 2020 Ameed Sayeh. All rights reserved.
//

import UIKit

class FooterCell: UITableViewCell {

    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.origin.x += 20
            frame.size.width -= 2 * 20
            super.frame = frame
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 10)
        self.selectionStyle = .none
    }
    
}
