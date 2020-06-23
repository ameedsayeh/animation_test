//
//  TaskCell.swift
//  Animation Test
//
//  Created by Ameed Sayeh on 6/15/20.
//  Copyright © 2020 Ameed Sayeh. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var imageIconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var progressViewContainer: UIView!
    @IBOutlet weak var contentViewContainer: UIView!
    
    @IBOutlet weak var titleAndSubtitleVerticalSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressViewTitleVerticalSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressViewSubtitleVerticalSpacingConstraint: NSLayoutConstraint!

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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
        self.progressViewTitleVerticalSpacingConstraint.isActive = selected
        self.progressViewSubtitleVerticalSpacingConstraint.isActive = selected
        self.titleAndSubtitleVerticalSpacingConstraint.isActive = !selected
        
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseInOut, animations: {
            
            if selected {
                self.progressViewContainer.alpha = 1
            } else {
                self.progressViewContainer.alpha = 0
            }
            
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc
    func cellTapped(gestureRecognizer: UITapGestureRecognizer) {
        
        self.progressViewTitleVerticalSpacingConstraint.isActive.toggle()
        self.progressViewSubtitleVerticalSpacingConstraint.isActive.toggle()
        self.titleAndSubtitleVerticalSpacingConstraint.isActive.toggle()
        
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            
            self.layoutIfNeeded()
            
        }, completion: { _ in
            self.progressViewContainer.isHidden.toggle()
        })
        
        
        
        
    }
    
    func setup(with task: Task) {
        self.titleLabel.text = task.title
        self.subtitleLabel.text = task.subTitle
        self.imageIconView.image = UIImage(named: task.imageName)
    }
    
}
