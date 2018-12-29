
//
//  LRStackView.swift
//  RippleListening
//
//  Created by LuRui on 2018/12/28.
//  Copyright © 2018 Ripple. All rights reserved.
//

import UIKit


private let guideIdentifier = "LRStackViewSpacingLayoutGuide"
private let topConstraintIdentifier = "LRStackViewSpacingLayoutGuideTopConstraint"
private let rightConstraintIdentifier = "LRStackViewSpacingLayoutGuideRightConstraint"
private let bottomConstraintIdentifier = "LRStackViewSpacingLayoutGuideBottomConstraint"
private let leftConstraintIdentifier = "LRStackViewSpacingLayoutGuideLeftConstraint"


extension UIView {
    
    open var lr_spacingInsets: UIEdgeInsets {
        set {
            if lr_spacingLayoutGuide() != nil {
                constraints.forEach { constraint in
                    if constraint.identifier == leftConstraintIdentifier {
                        constraint.constant = -newValue.left
                    } else if constraint.identifier == rightConstraintIdentifier {
                        constraint.constant = newValue.right
                    } else if constraint.identifier == topConstraintIdentifier {
                        constraint.constant = -newValue.top
                    } else if constraint.identifier == bottomConstraintIdentifier {
                        constraint.constant = newValue.bottom
                    }
                }
            } else {
                lr_addSpacingLayoutGuide(with: newValue)
            }
        }
        get {
            if lr_spacingLayoutGuide() == nil { return .zero }
            var insets = UIEdgeInsets.zero
            constraints.forEach { constraint in
                if constraint.identifier == leftConstraintIdentifier {
                    insets.left = -constraint.constant
                } else if constraint.identifier == rightConstraintIdentifier {
                    insets.right = constraint.constant
                } else if constraint.identifier == topConstraintIdentifier {
                    insets.top = -constraint.constant
                } else if constraint.identifier == bottomConstraintIdentifier {
                    insets.bottom = constraint.constant
                }
            }
            return insets
        }
    }
    
    fileprivate func lr_spacingLayoutGuide() -> UILayoutGuide? {
        return layoutGuides.first { $0.identifier == guideIdentifier }
    }
    
    @discardableResult
    fileprivate func lr_addSpacingLayoutGuide(with insets: UIEdgeInsets) -> UILayoutGuide {
        let guide = UILayoutGuide()
        guide.identifier = guideIdentifier
        addLayoutGuide(guide)
        let top = guide.topAnchor.constraint(equalTo: topAnchor, constant: -insets.top)
        top.identifier = topConstraintIdentifier
        let right = guide.rightAnchor.constraint(equalTo: rightAnchor, constant: insets.right)
        right.identifier = rightConstraintIdentifier
        let bottom = guide.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom)
        bottom.identifier = bottomConstraintIdentifier
        let left = guide.leftAnchor.constraint(equalTo: leftAnchor, constant: -insets.left)
        left.identifier = leftConstraintIdentifier
        NSLayoutConstraint.activate([top, right, bottom, left])
        return guide
    }
}


extension UIStackView {
    
    open var lr_arrangedSubviews: [UIView] {
        return arrangedSubviews.map { return ($0 as? LRDummyView)?.contentView ?? $0 }
    }
    
    open func lr_addArrangedSubview(_ view: UIView) {
        addArrangedSubview(LRDummyView(contentView: view))
    }
    
    open func lr_removeArrangedSubview(_ view: UIView) {
        removeArrangedSubview((view.superview as? LRDummyView) ?? view)
    }
    
    open func lr_insertSubview(_ view: UIView, at index: Int) {
        insertArrangedSubview(LRDummyView(contentView: view), at: index)
    }
}


extension UIStackView {
    
    fileprivate class LRDummyView: UIView {
        
        var contentView: UIView
        
        init(contentView: UIView) {
            self.contentView = contentView
            super.init(frame: .zero)
            setupView()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView() {
            addSubview(contentView)
            var guide: UILayoutGuide! = contentView.lr_spacingLayoutGuide()
            if guide == nil {
                guide = contentView.lr_addSpacingLayoutGuide(with: .zero)
            }
            topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
            rightAnchor.constraint(equalTo: guide.rightAnchor).isActive = true
            bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            leftAnchor.constraint(equalTo: guide.leftAnchor).isActive = true
        }
    }
}
