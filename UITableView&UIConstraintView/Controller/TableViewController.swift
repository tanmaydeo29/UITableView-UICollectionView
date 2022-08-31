//
//  TableViewController.swift
//  UITableView&UIConstraintView
//
//  Created by Tanmay Deo on 30/08/22.
//

import UIKit

class TableViewController: UIViewController {
    
    let cellVC = CellNameViewController()
    
    var array = ["Name 1" , "Name 2" , "Name 3" , "Name 4" , "Name 5" , "Name 6" , "Name 7"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(insert)) ,
                                              UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(remove))]
    }
    
    
    @objc func insert(){
        let toAdd = UIAlertController(title: "Add Cell", message: "Enter the name", preferredStyle: .alert)
        toAdd.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter Something"
            textField.returnKeyType = .continue
        })
        toAdd.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            let tfs = toAdd.textFields
            let name = tfs?[0]
            self.array.insert(name!.text  ?? "Not Found", at: self.array.count)
            self.tableView.reloadData()
        }))
        present(toAdd, animated: true)
    }
    
    @objc func remove(){
        let toRemove = UIAlertController(title: "Delete Last Cell", message: "Are you Sure", preferredStyle: .alert)
        toRemove.addAction(UIAlertAction(title: "NO", style: .cancel, handler: {_ in
            print("Cancel")
        }))
        toRemove.addAction(UIAlertAction(title: "YES", style: .destructive , handler: {_ in
            self.array.remove(at: self.array.count - 1)
            self.tableView.reloadData()
        }))
        present(toRemove, animated: true)
    }
}

extension TableViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "CellNameViewController") as! CellNameViewController
        destinationVC.cellName = array[indexPath.row]
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    
}

