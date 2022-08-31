//
//  CellNameViewController.swift
//  UITableView&UIConstraintView
//
//  Created by Tanmay Deo on 30/08/22.
//

import UIKit

class CellNameViewController: UIViewController {

    
    var cellName = ""
    
    @IBOutlet weak var cellNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cellNameLbl.text = cellName
    }
}
