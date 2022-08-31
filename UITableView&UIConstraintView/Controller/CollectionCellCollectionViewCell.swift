//
//  CollectionCellCollectionViewCell.swift
//  UITableView&UICollectionView
//
//  Created by Tanmay Deo on 31/08/22.
//

import UIKit

class CollectionCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    
    func fetch(with cellcontent : CellContent){
        cellImageView.image = cellcontent.image
        cellLabel.text = cellcontent.title
    }
    
}
