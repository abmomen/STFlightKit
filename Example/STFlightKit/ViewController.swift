//
//  ViewController.swift
//  STFlightKit
//
//  Created by 20514535 on 12/20/2022.
//  Copyright (c) 2022 20514535. All rights reserved.
//

import UIKit
import STFlightKit

class ViewController: UIViewController {

    @IBAction func didTapSearchFlight(_ sender: UIButton) {
        present(FlightSearchVC.instantiate(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

