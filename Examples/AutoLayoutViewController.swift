//
//  AutoLayoutViewController.swift
//  CCSegmentControllers
//
//  Created by Bruce on 2019/12/18.
//  Copyright © 2019 JFF147. All rights reserved.
//

import UIKit
import SnapKit

class AutoLayoutViewController: UIViewController {
    
    private var controllers: CCSegmentControllers!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        controllers = CCSegmentControllers(classes: [
            (ViewControllerA.self, nil),
            (ViewControllerB.self, nil),
            (ViewControllerC.self, nil)], selectedIndex: 1)
        controllers.delegate = self
        addChild(controllers)
        view.addSubview(controllers.view)
        controllers.view.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.centerX.equalToSuperview()
        }
    }

}

extension AutoLayoutViewController: CCSegmentControllersDelegate {
    
    func didScroll(_ index: Int) {
        print(index)
    }
    
}
