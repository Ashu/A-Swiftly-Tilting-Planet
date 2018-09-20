import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activity = NSUserActivity(activityType: "com.calebrwells.shortcut")
        activity.title = "Hello, world!"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.userInfo = ["siri": "shortcut"]
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier("siri")
        self.userActivity = activity
    }

}














