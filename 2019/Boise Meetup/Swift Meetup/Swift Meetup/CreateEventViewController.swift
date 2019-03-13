import UIKit
import EventKit

class CreateEventViewController: UIViewController {
    
    let dateFormatter = DateFormatter()
    
    let eventTitle = TextField()
    let eventNotes = TextField()
    let eventStart = TextField()
    let eventEnd = TextField()
    let button = Button()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        navigationItem.title = "Create Event"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismissView))
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        createSubviews()
    }
    
    func createSubviews() {
        button.setTitle("Create event", for: .normal)
        button.addTarget(self, action: #selector(handleCreateEvent), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [eventTitle, eventNotes, eventStart, eventEnd, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.distribution = .equalCentering
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 360),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80)
        ])
    }
    
    @objc func handleCreateEvent() {
        print("Create event")
        let eventStore: EKEventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { (granted, error) in
            DispatchQueue.main.async {
                if (granted) && (error == nil){
                    let event: EKEvent = EKEvent(eventStore: eventStore)
                    event.title = self.eventTitle.text!
                    event.notes = self.eventNotes.text!
                    
                    let evtStartDate = self.dateFormatter.date(from: self.eventStart.text!)
                    event.startDate = evtStartDate!
                    
                    let evtEndDate = self.dateFormatter.date(from: self.eventEnd.text!)
                    event.endDate = evtEndDate!
                    event.calendar = eventStore.defaultCalendarForNewEvents
                    
                    do {
                        try eventStore.save(event, span: .thisEvent)
                    } catch let error as NSError {
                        print("error: \(error)")
                    }
                } else {
                    print("Error")
                }
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleDismissView() {
        dismiss(animated: true, completion: nil)
    }
}
