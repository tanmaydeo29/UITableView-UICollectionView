//
//  TableViewController.swift
//  UITableView&UIConstraintView
//
//  Created by Tanmay Deo on 30/08/22.
//

import UIKit

class TableViewController: UIViewController {
    
    let cellVC = CellNameViewController()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items = [Name]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllItems()
        tableView.reloadData()
        
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
            if(name!.text != ""){
                self.addItems(itemName: name!.text!)
            }
        }))
        toAdd.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        present(toAdd, animated: true)
    }
    
    @objc func remove(){
        let toRemove = UIAlertController(title: "Delete Last Cell", message: "Are you Sure", preferredStyle: .alert)
        toRemove.addAction(UIAlertAction(title: "NO", style: .cancel, handler: {_ in
            print("Cancel")
        }))
        toRemove.addAction(UIAlertAction(title: "YES", style: .destructive , handler: {_ in
            let lastItem = self.items[self.items.count - 1]
            self.deleteItems(name : lastItem)
            self.tableView.reloadData()
        }))
        if(items.count >= 1){
            present(toRemove, animated: true)
        }
    }
    
    func getAllItems(){
        do{
            items = try context.fetch(Name.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            print("Error occured")
        }
        
    }

    func addItems(itemName : String){
        let newItem = Name(context: context)
        newItem.name = itemName
        do{
            try context.save()
            getAllItems()
            print("Item Added")
        }
        catch{
            print("Not saved")
        }
    }

    func deleteItems(name : Name){
        context.delete(name)
        do{
            try context.save()
            getAllItems()
            print("Item Deleted")
        }
        catch{
            print("Not saved")
        }
    }
}

extension TableViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "CellNameViewController") as! CellNameViewController
        destinationVC.cellName = items[indexPath.row].name!
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}

