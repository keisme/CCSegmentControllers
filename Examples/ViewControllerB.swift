//
//  ViewControllerB.swift
//  CCSegmentControllers
//
//  Created by Bruce on 2019/12/17.
//  Copyright © 2019 JFF147. All rights reserved.
//

import UIKit

class ViewControllerB: CCBaseSegmentController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        if let (v1, v2) = params as? (String, String) {
            label.text = "\(v1), \(v2)"
        }
    }

}
