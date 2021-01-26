//
//  TaskCell.swift
//  Animation Test
//
//  Created by Ameed Sayeh on 6/15/20.
//  Copyright © 2020 Ameed Sayeh. All rights reserved.
//

import UIKit

@objc class TaskCell: UITableViewCell {
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var requiredLabel: UILabel!
    @IBOutlet weak var taskSubtitleLabel: UILabel!
    @IBOutlet weak var taskIconImageView: UIImageView!
    @IBOutlet weak var taskActionIconImageView: UIImageView!
    @IBOutlet weak var progressContainerView: UIView!
    @IBOutlet weak var progressEmptyView: UIView!
    @IBOutlet weak var progressLineView: UIView!
    @IBOutlet weak var progressDescriptionLabel: UILabel!
    @IBOutlet weak var bottomSeperatorView: UIView!
    
    @IBOutlet weak var requiredLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var requiredLabelTopSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var requiredLabelBottomSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressContainerViewTopSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressLineViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressContainerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomSeperatorViewHeightConstraint: NSLayoutConstraint!
    
    weak var delegate: TaskCellDelegate?
    
    
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
        
        self.setupProgressView()
        self.setupRequiredLabel()
        self.hideProgressContainer(hide: true, completion: nil)
        self.hideRequiredLabel(hide: true, completion: nil)
    }
    
    private func setupProgressView() {
        
        self.progressEmptyView.layer.cornerRadius = 7
        self.progressLineView.layer.cornerRadius = 7
    }
    
    private func setupRequiredLabel() {
        
        self.requiredLabel.text = "  *REQUIRED  "
        self.requiredLabel.layer.borderWidth = 1
        self.requiredLabel.layer.borderColor = self.requiredLabel.textColor.cgColor
        self.requiredLabel.layer.cornerRadius = 9
    }
    
    func completeTask(completion: ((Bool) -> Void)?) {
        
        self.grayOutColors()
        self.hideProgressContainer(hide: false, completion: {_ in
            self.setProgressValue(percentage: 1, completion: {_ in
                self.hideProgressContainer(hide: true, completion: completion)
            })
        })
    }
    
    func grayOutColors() {
        
        self.taskTitleLabel.textColor = UIColor.lightGray
        self.taskSubtitleLabel.textColor = UIColor.lightGray
        self.progressDescriptionLabel.textColor = UIColor.lightGray
        self.requiredLabel.textColor = UIColor.lightGray
        self.requiredLabel.layer.borderColor = UIColor.lightGray.cgColor
        self.taskIconImageView.image = self.taskIconImageView.image?.withTintColor(UIColor.lightGray)
    }
    
    func setProgressValue(percentage: CGFloat, completion: ((Bool) -> Void)?) {
        
        self.progressLineViewWidthConstraint.constant = percentage * self.progressEmptyView.frame.width
        self.animateLayout(duration: 1, completion: completion)
    }
    
    func hideProgressContainer(hide: Bool, completion: ((Bool) -> Void)?) {
        
        self.progressContainerViewHeightConstraint.constant = hide ? 0 : 28
        self.progressContainerViewTopSpaceConstraint.constant = hide ? 0 : 16
        self.progressContainerView.isHidden = hide
        self.animateLayout(duration: 1, completion: completion)
    }
    
    func hideRequiredLabel(hide: Bool, completion: ((Bool) -> Void)?) {
        
        self.requiredLabelTopSpaceConstraint.constant = hide ? 0 : 6
        self.requiredLabelHeightConstraint.constant = hide ? 0 : 18
        self.requiredLabel.isHidden = hide
        self.animateLayout(duration: 1, completion: completion)
    }
    
    func animateLayout(duration: Double, completion: ((Bool) -> Void)?) {
        
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
            
            self.delegate?.taskCellDelegateBeginTableViewUpdate()
            self.layoutIfNeeded()
            
        }, completion: completion)
        self.delegate?.taskCellDelegateEndTableViewUpdate()
    }
    
    func setup(with task: Task) {
        self.taskTitleLabel.text = task.title
        self.taskSubtitleLabel.text = task.subTitle
        self.taskIconImageView.image = UIImage(named: task.imageName)
    }
    
}


@objc protocol TaskCellDelegate: NSObjectProtocol {
    
    func taskCellDelegateBeginTableViewUpdate()
    func taskCellDelegateEndTableViewUpdate()
}
