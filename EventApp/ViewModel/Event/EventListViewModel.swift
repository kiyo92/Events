//
//  EventListViewModel.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 28/12/21.
//

import Foundation

protocol EventListProtocol: AnyObject {
    func didGetData(events: [EventModel])
    func didError(error: String)
}

class EventListViewModel {
    
    private var apiService : EventServices = EventServices()
    
    weak var delegate: EventListProtocol?
    
    func getEventList(){
        apiService.getEventList{ (events, error) in
            if (events.count > 0){
                print(events)
                self.delegate?.didGetData(events: events)
            } else if (error != "") {
                self.delegate?.didError(error: error)
            }
        }
    }
    
}
