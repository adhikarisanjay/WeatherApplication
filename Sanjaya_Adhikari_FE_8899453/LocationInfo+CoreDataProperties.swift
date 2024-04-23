//
//  LocationInfo+CoreDataProperties.swift
//  Sanjaya_Adhikari_FE_8899453
//
//  Created by Sanjay adhikari on 10/08/2023.
//
//

import Foundation
import CoreData


extension LocationInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationInfo> {
        return NSFetchRequest<LocationInfo>(entityName: "LocationInfo")
    }

    @NSManaged public var cityName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var imageName: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}

extension LocationInfo : Identifiable {

}
