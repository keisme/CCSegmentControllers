//
//  ViewControllerA.swift
//  CCSegmentControllers
//
//  Created by Bruce on 2019/12/17.
//  Copyright © 2019 JFF147. All rights reserved.
//

import UIKit

class ViewControllerA: CCBaseSegmentController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        if let player = params as? Player {
            label.text = "\(player.name), \(player.age)"
        }
    }

}
