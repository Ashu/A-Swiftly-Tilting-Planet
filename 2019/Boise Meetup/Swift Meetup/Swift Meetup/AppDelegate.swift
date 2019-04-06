import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        if let tabVC = self.window?.rootViewController as? UITabBarController {
            if shortcutItem.type == "Event" {
                tabVC.selectedIndex = 0
                tabVC.viewControllers?[0].present(CreateEventViewController(), animated: false, completion: nil)
            } else if shortcutItem.type == "Message" {
                tabVC.selectedIndex = 1
            } else if shortcutItem.type == "Profile" {
                tabVC.selectedIndex = 2
            }
        }
    }
}
