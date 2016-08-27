 /*
    ddelay().elayUse(n) { () -> () in
        //延时n秒后执行该闭包
    }
 */
import UIKit

class delay {
    func delayUse(time:Double,closure:()->()) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time*Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
}
