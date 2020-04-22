//
// UIStackView+LRCustomSpacing.swift
//
// MIT License
//
// Copyright (c) 2018 Lu Rui
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//


import UIKit


extension UIView {
    
    /// The custom spacing insets for this view, used only if this view was or will be added to `UIStackView`  by `lr_addArrangedSubview(_:)` or `lr_insertArrangedSubview(_:at:)`. Setting this property will take the change immediately. To animate the change, set it in a `UIView` aniamation closure. The default value of this property is `UIEdgeInsets.zero`.
    ///
    /// In a horizontal UIStackView, `.left` and `.right` define the spacing between this view and its siblings, `.top` and `.bottom` define the spacing between this view and the `UIStackView`.
    ///
    /// In a vertical UIStackView, `.top` and `.bottom` define the spacing between this view and its siblings, `.left` and `.right` define the spacing between this view and the `UIStackView`.
    ///
    /// For more on how `lr_stackSpacing` works under different conditions, see [LRCustomSpacingStackView wiki.](https://github.com/lurui1029/LRCustomSpacingStackView/wiki/)
    open var lr_stackSpacing: UIEdgeInsets {
        get {
            return insetsFromSpacingLayoutGuide()
        }
        set {
            if let guide = spacingLayoutGuide() {
                removeLayoutGuide(guide)
            }
            addSpacingLayoutGuide(with: newValue)
            updateDummyViewConstraints(with: newValue)
        }
    }
}


extension UIStackView {
    
    /// Same as `init(arrangedSubviews:)`. If you intend to space these views by their `lr_stackSpacing`, you must use this method instead of the original `init(arrangedSubviews:)`
    public convenience init(lr_arrangedSubviews views: [UIView]) {
        self.init(arrangedSubviews: views.map{ LRDummyView(contentView: $0) })
    }
    
    /// Same as `arrangedSubviews`. If any of arrangedSubviews was added by `lr_addArrangedSubview(_:)` or `lr_insertArrangedSubview(_:at:)`, you must use this property to correctly retrieve arrangedSubviews.
    ///
    /// If no arrangedSubview was added by `lr_addArrangedSubview(_:)` or `lr_insertArrangedSubview(_:at:)`, you can still use this method to correctly retrieve arrangedSubviews. It would have no difference from the original one in this case.
    open var lr_arrangedSubviews: [UIView] {
        return arrangedSubviews.map { return ($0 as? LRDummyView)?.contentView ?? $0 }
    }
    
    /// Same as `addArrangedSubviews(_:)`. If you intend to space this view by its `lr_stackSpacing`, you must use this method instead of the original `addArrangedSubviews(_:)`
    open func lr_addArrangedSubview(_ view: UIView) {
        addArrangedSubview(LRDummyView(contentView: view))
    }
    
    /// Same as `removeArrangedSubview(_:)`. If the view was added by `lr_addArrangedSubview(_:)` or `lr_insertArrangedSubview(_:at:)`, you must use this method or call `removeFromParent()` on the view to correctly remove this view.
    ///
    /// If the view was not added by `lr_addArrangedSubview(_:)` or `lr_insertArrangedSubview(_:at:)`, you can still use this method to correctly remove the view. It would have no difference from the original one in this case.
    open func lr_removeArrangedSubview(_ view: UIView) {
        if let dummyView = view.superview as? LRDummyView {
            removeArrangedSubview(dummyView)
            view.removeFromSuperview()
        } else {
            removeArrangedSubview(view)
        }
    }
    
    /// Same as `insertArrangedSubview(_:at:)`. If you intend to space this view by its `lr_stackSpacing`, you must use this method instead of the original `insertArrangedSubview(_:at:)`
    open func lr_insertArrangedSubview(_ view: UIView, at index: Int) {
        insertArrangedSubview(LRDummyView(contentView: view), at: index)
    }
}


// MARK: - Privates -

fileprivate let guideIdentifier = "LRStackViewSpacingLayoutGuide"
fileprivate let topConstraintIdentifier = "LRStackViewSpacingLayoutGuideTopConstraint"
fileprivate let rightConstraintIdentifier = "LRStackViewSpacingLayoutGuideRightConstraint"
fileprivate let bottomConstraintIdentifier = "LRStackViewSpacingLayoutGuideBottomConstraint"
fileprivate let leftConstraintIdentifier = "LRStackViewSpacingLayoutGuideLeftConstraint"

fileprivate extension UIView {
    
    func spacingLayoutGuide() -> UILayoutGuide? {
        return layoutGuides.first { $0.identifier == guideIdentifier }
    }
    
    func addSpacingLayoutGuide(with insets: UIEdgeInsets) {
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
    }
    
    func insetsFromSpacingLayoutGuide() -> UIEdgeInsets {
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
    
    func updateDummyViewConstraints(with insets: UIEdgeInsets) {
        if let dummyView = superview as? LRDummyView {
            dummyView.topConstraint.constant = insets.top
            dummyView.rightConstraint.constant = -insets.right
            dummyView.bottomConstraint.constant = -insets.bottom
            dummyView.leftConstraint.constant = insets.left
        }
    }
}


fileprivate class LRDummyView: UIView {
    
    var contentView: UIView
    
    var topConstraint: NSLayoutConstraint!
    
    var rightConstraint: NSLayoutConstraint!
    
    var bottomConstraint: NSLayoutConstraint!
    
    var leftConstraint: NSLayoutConstraint!
    
    private var hiddenObservation: NSKeyValueObservation!
    
    init(contentView: UIView) {
        self.contentView = contentView
        super.init(frame: .zero)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        let insets = contentView.lr_stackSpacing
        topConstraint = contentView.topAnchor.constraint(equalTo: topAnchor, constant: insets.top)
        rightConstraint = contentView.rightAnchor.constraint(equalTo: rightAnchor, constant: -insets.right)
        bottomConstraint = contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom)
        leftConstraint = contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: insets.left)
        NSLayoutConstraint.activate([topConstraint, rightConstraint, bottomConstraint, leftConstraint])
        
        isHidden = contentView.isHidden
        hiddenObservation = contentView.observe(\.isHidden) { [unowned self] (_, _) in
            self.isHidden = contentView.isHidden
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented. PRs welcome")
    }
    
    override func willRemoveSubview(_ subview: UIView) {
        removeFromSuperview()
    }
}
