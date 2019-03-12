//
//  CreateEventViewController.swift
//  Swift Meetup
//
//  Created by Caleb Wells on 3/11/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit
import EventKit

class CreateEventViewController: UIViewController {
    
    let dateFormatter = DateFormatter()

    let eventTitle = UITextField()
    let eventNotes = UITextField()
    let eventStart = UITextField()
    let eventEnd = UITextField()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1)
        
        eventTitle.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        eventTitle.placeholder = "Entre title"
        
        let textFields = [eventTitle, eventNotes, eventStart, eventEnd]
        
        for item in textFields {
            item.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            item.placeholder = "Something"
            item.borderStyle = .roundedRect
            
            item.translatesAutoresizingMaskIntoConstraints = false
            item.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        button.addTarget(self, action: #selector(buttonUpdateCal), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [eventTitle, eventNotes, eventStart, eventEnd, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    @objc func buttonUpdateCal() {
        let eventStore: EKEventStore = EKEventStore()
        eventStore.requestAccess(to: .event) {(granted, error) in
            if (granted) && (error == nil){
                print("granted \(granted)")
                print("error \(error)")
                
                let event: EKEvent = EKEvent(eventStore: eventStore)
                event.title = self.eventTitle.text!
                event.notes = self.eventNotes.text!
                
                let evtStartDate = self.dateFormatter.date(from: self.eventStart.text!)
                event.startDate = evtStartDate!
                
                let evtEndDate   = self.dateFormatter.date(from: self.eventEnd.text!)
                event.endDate    = evtEndDate!
                
                event.calendar   = eventStore.defaultCalendarForNewEvents
                
                do {
                    try eventStore.save(event, span: .thisEvent)
                }
                catch let error as NSError{
                    print("error: \(error)")
                }
                print("Save Event")
                print("Date: \(Date())")
                
            } else {
                print("Error: \(error)")
            }
        }
    }
}
