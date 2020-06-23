//
//  HeaderCell.swift
//  Animation Test
//
//  Created by Ameed Sayeh on 6/15/20.
//  Copyright © 2020 Ameed Sayeh. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.origin.x += 10
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        self.separatorInset = .zero
        self.layoutMargins = .zero
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.roundCorners(corners: [.topRight, .topLeft], radius: 10)
        self.selectionStyle = .none
    }
}
