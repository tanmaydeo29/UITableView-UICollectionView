//
//  ViewController.swift
//  UITableView&UIConstraintView
//
//  Created by Tanmay Deo on 30/08/22.
//

import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func constraintViewButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToConstraintView", sender: self)
    }
    @IBAction func tableViewButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToTableView", sender: self)
        
    }
}

