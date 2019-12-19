//
//  CCSegmentControllers.swift
//  CCSegmentControllers
//
//  Created by Bruce on 2019/12/17.
//  Copyright © 2019 JFF147. All rights reserved.
//

import UIKit

public protocol CCSegmentControllersDelegate: AnyObject {
    func segmentController(_ segmentController: CCSegmentControllers, scrollTo index: Int)
}

public class CCSegmentControllers: UIViewController {
    
    public weak var delegate: CCSegmentControllersDelegate?
    
    public var backgroundColor: UIColor = .white {
        didSet {
            sv.backgroundColor = backgroundColor
        }
    }
    
    private var classes: [(CCBaseSegmentController.Type, Any?)]!
    private var sv: UIScrollView!
    private var childControllers: [CCBaseSegmentController?]!
    private var selectedIndex: Int!
    private var isInitial = true

    
    /// initialize
    /// - Parameter classes: (classtype, params)
    /// - Parameter selectedIndex: initial seleted index
    public init(classes: [(CCBaseSegmentController.Type, Any?)], selectedIndex: Int) {
        self.classes = classes
        self.selectedIndex = selectedIndex
        self.childControllers = Array(repeating: nil, count: classes.count)
        super.init(nibName: nil, bundle: nil)
    }
    
    public func scroll(to index: Int, animated: Bool = false) {
        if selectedIndex == index { return }
        selectedIndex = index
        addChildControllerIfNeeded(index: selectedIndex)
        sv.setContentOffset(CGPoint(x: sv.bounds.width * CGFloat(selectedIndex), y: 0), animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        addSv()
        addChildController(index: selectedIndex)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sv.frame = view.bounds
        sv.contentSize = CGSize(width: view.bounds.width * CGFloat(classes.count), height: 0)
        
        for (i, vc) in childControllers.enumerated() {
            if vc != nil {
                layoutView(controller: vc!, index: i)
            }
        }
        
        sv.setContentOffset(CGPoint(x: sv.bounds.width * CGFloat(selectedIndex), y: 0), animated: false)
    }
    
    func addSv() {
        sv = UIScrollView()
        sv.delegate = self
        sv.isPagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        sv.showsVerticalScrollIndicator = false
        sv.backgroundColor = backgroundColor
        view.addSubview(sv)
    }
    
    func addChildControllerIfNeeded(index: Int) {
        if childControllers[index] != nil { return }
        let vc = addChildController(index: index)
        layoutView(controller: vc, index: index)
    }
    
    @discardableResult
    func addChildController(index: Int) -> CCBaseSegmentController {
        let v = classes[index]
        let vc = v.0.init()
        vc.ccParams = v.1
        childControllers[index] = vc
        addChild(vc)
        sv.addSubview(vc.view)
        
        return vc
    }
    
    func layoutView(controller: CCBaseSegmentController, index: Int) {
        let width = sv.bounds.width
        let height = sv.bounds.height
        controller.view.frame = CGRect(x: width * CGFloat(index), y: 0, width: width, height: height)
    }
    
}

extension CCSegmentControllers: UIScrollViewDelegate {
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        selectedIndex = Int(scrollView.contentOffset.x / scrollView.bounds.width + 0.5)
        addChildControllerIfNeeded(index: selectedIndex)
        delegate?.segmentController(self, scrollTo: selectedIndex)
    }
    
}
