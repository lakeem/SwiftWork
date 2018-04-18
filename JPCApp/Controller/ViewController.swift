//
//  ViewController.swift
//  JPCApp
//
//  Created by lakeem muhammad on 4/18/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //titleLabel.attributedText = dataPrepComplete[myIndex].htmlDataToDisplay
            
        titleLabel.text = dataPrepComplete[myIndex].description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

