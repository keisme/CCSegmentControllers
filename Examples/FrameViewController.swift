//
//  FrameViewController.swift
//  CCSegmentControllers
//
//  Created by Bruce on 2019/12/18.
//  Copyright © 2019 JFF147. All rights reserved.
//

import UIKit

struct Player {
    var name: String
    var age: Int
}

class FrameViewController: UIViewController {
    
    private var controllers: CCSegmentControllers!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Scroll", style: .done, target: self, action: #selector(scroll))
        
        controllers = CCSegmentControllers(classes: [
            (ViewControllerA.self, Player(name: "RO", age: 45)),
            (ViewControllerB.self, ("B", "BBB")),
            (ViewControllerC.self, nil)], selectedIndex: 1)
        controllers.delegate = self
        addChild(controllers)
        view.addSubview(controllers.view)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        controllers.view.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 20, width: view.bounds.width - 40, height: view.bounds.height - 40 - view.safeAreaInsets.top)
    }
    
    @objc func scroll() {
        controllers.scroll(to: 2, animated: true)
    }

}

extension FrameViewController: CCSegmentControllersDelegate {
    
    func didScroll(_ index: Int) {
        print(index)
    }
    
}
