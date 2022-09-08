//
//  Name+CoreDataProperties.swift
//  UITableView&UICollectionView
//
//  Created by Tanmay Deo on 02/09/22.
//
//

import Foundation
import CoreData


extension Name {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Name> {
        return NSFetchRequest<Name>(entityName: "Name")
    }

    @NSManaged public var name: String?

}

extension Name : Identifiable {

}
