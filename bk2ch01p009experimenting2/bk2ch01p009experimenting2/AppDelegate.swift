
import UIKit

extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]?)
        -> Bool {
            self.window = self.window ?? UIWindow()
            self.window!.rootViewController = UIViewController()
            // here we can add subviews
            let mainview = self.window!.rootViewController!.view! // new in Swift 3 of 6/6, IUO does not propagate
            let v = UIView(frame:CGRect(100,100,50,50))
            v.backgroundColor = .red // small red square
            mainview.addSubview(v) // add it to main view
            // and the rest is as before...
            self.window!.backgroundColor = .white
            self.window!.makeKeyAndVisible()
            return true
    }



}

