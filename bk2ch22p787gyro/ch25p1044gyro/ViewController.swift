

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motman = CMMotionManager()
    var timer : Timer!
    
    @IBAction func doButton (_ sender: Any!) {
        guard self.motman.isDeviceMotionAvailable else {
            print("Oh, well")
            return
        }
        // idiot Swift numeric foo (different in iOS 8.3 but still idiotic)
        let ref = CMAttitudeReferenceFrame.xMagneticNorthZVertical
        let avail = CMMotionManager.availableAttitudeReferenceFrames()
        guard avail.contains(ref) else {
            print("darn")
            return
        }
        self.motman.showsDeviceMovementDisplay = true
        self.motman.deviceMotionUpdateInterval = 1.0 / 30.0
        self.motman.startDeviceMotionUpdates(using: ref)
        let t = self.motman.deviceMotionUpdateInterval * 10
        self.timer = Timer.scheduledTimer(timeInterval:t, target:self, selector:#selector(pollAttitude),userInfo:nil, repeats:true)
        
        print("starting")
    }
    
    func pollAttitude(_: Any!) {
        guard let mot = self.motman.deviceMotion else {return}
        // more idiotic Swift numeric foo
        let acc = mot.magneticField.accuracy.rawValue
        if acc <= CMMagneticFieldCalibrationAccuracyLow.rawValue {
            print(acc)
            return // not ready yet
        }
        let att = mot.attitude
        let to_deg = 180.0 / .pi
        print("\(att.pitch * to_deg), \(att.roll * to_deg), \(att.yaw * to_deg)")
        let g = mot.gravity
        let whichway = g.z > 0 ? "forward" : "back"
        print("pitch is tilted \(whichway)")
    }


}
