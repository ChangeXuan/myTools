//自定义一个手势，当从左上角滑到右下角时出发action
import UIKit
import UIKit.UIGestureRecognizerSubclass    //必须导入

class selfGesture:UIGestureRecognizer {
    var leftT = false
    var rightB = false
    override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        leftT = false
        rightB = false
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent) {
        let touch:UITouch = touches.first!
        let location = touch.locationInView(self.view)
        print(location)
        
        if location.x < 10 && location.y < 10 {
            leftT = true
        }
        
        if (location.x + 10) > 400 && (location.y + 10) > 400 {
            rightB = true
        }
        
        if leftT && rightB {
            self.state = UIGestureRecognizerState.Ended
        }
    }
}
