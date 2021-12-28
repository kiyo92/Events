//
//  EventServices.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 28/12/21.
//

import Foundation

class EventServices :  NSObject {
    
    func getEventList(completion : @escaping ([EventModel], String) -> ()){
        
        guard let eventsUrl = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events")
        else {
            return
        }
        
        URLSession.shared.dataTask(with: eventsUrl) { (data, urlResponse, error) in
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                print(data)
                let events = try! jsonDecoder.decode([EventModel].self, from: data)
                completion(events, "")
            }
            
            completion([], error.debugDescription)
        }.resume()
    }
}
