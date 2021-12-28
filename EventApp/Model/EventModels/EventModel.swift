//
//  EventModel.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 28/12/21.
//

import Foundation

struct EventModel: Decodable {
    
    var id: String?
    var date: Double?
    var description: String?
    var image: String?
    var longitude: Double?
    var latitude: Double?
    var price: Double?
    var title: String?
    
}
