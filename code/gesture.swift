import UIKit

class gesture {
    
    /*
     gesture().gestureSwipe(self,ctrlView: self.view,direction: .Down)
     item1:
            需要调用手势的类
            该类必须要实现swipeAction(_:)
     item2:
            需要添加手势的控件
     item3:
            设置滑动响应的方向
     */
    func gestureSwipe(controller:UIViewController,ctrlView:UIView,direction:UISwipeGestureRecognizerDirection) {
        let swipe = UISwipeGestureRecognizer(target: controller,action: #selector(self.swipeAction(_:)))
        swipe.direction = direction
        ctrlView.addGestureRecognizer(swipe)
    }
    
    
    /*
     gesture().gestureTap(self, ctrlView: self.gestureView, tapNum: 1)
     item1:
            需要调用手势的类
            该类必须要实现tapAction(_:)
     item2:
            需要添加手势的控件
     item3:
            设置响应的点击次数
     */
    func gestureTap(controller:UIViewController,ctrlView:UIView,tapNum:Int = 1) {
        let tap = UITapGestureRecognizer(target: controller,action: #selector(self.tapAction(_:)))
        tap.numberOfTapsRequired = tapNum
        tap.numberOfTouchesRequired = 1
        ctrlView.addGestureRecognizer(tap)
        
    }
    
    
    /*
     gesture().gesturePinch(self, ctrlView: self.gestureView)
     item1:
            需要调用手势的类
            该类必须要实现pinchAction(_:)
     item2:
            需要添加手势的控件
     */
    func gesturePinch(controller:UIViewController,ctrlView:UIView) {
        let pinch = UIPinchGestureRecognizer(target: controller,action: #selector(self.pinchAction(_:)))
        ctrlView.addGestureRecognizer(pinch)
    }
    
    
    /*
     gesture().gestureRotation(self, ctrlView: self.gestureView)
     item1:
            需要调用手势的类
            该类必须要实现rotationAction(_:)
     item2:
            需要添加手势的控件
     */
    func gestureRotation(controller:UIViewController,ctrlView:UIView) {
        let rotation = UIRotationGestureRecognizer(target: controller,action: #selector(self.rotationAction(_:)))
        ctrlView.addGestureRecognizer(rotation)
    }
    
    
    /*
     gesture().gesturePan(self, ctrlView: self.gestureView)
     item1:
            需要调用手势的类
            该类必须要实现panAction(_:)
     item2:
            需要添加手势的控件
     */
    func gesturePan(controller:UIViewController,ctrlView:UIView) {
        let pan = UIPanGestureRecognizer(target: controller,action: #selector(self.panAction(_:)))
        ctrlView.addGestureRecognizer(pan)
        
    }
    
    
    /*
     gesture().gestureLongPress(self, ctrlView: self.gestureView)
     item1:
            需要调用手势的类
            该类必须要实现longPressAction(_:)
     item2:
            需要添加手势的控件
     */
    func gestureLongPress(controller:UIViewController,ctrlView:UIView) {
        let longPress = UILongPressGestureRecognizer(target: controller,action: #selector(self.longPressAction(_:)))
        ctrlView.addGestureRecognizer(longPress)
    }
    
    func gestureSelf(controller:UIViewController,ctrlView:UIView) {
        let gestureSelf = selfGesture(target: controller,action: #selector(self.selfAction(_:)))
        ctrlView.addGestureRecognizer(gestureSelf)
    }
    
    /*-------------------------下面有些常用的方法------------------------------*/
    @objc private func swipeAction(sener:UISwipeGestureRecognizer) {
        print("this is often code")
        switch sener.direction {
        case UISwipeGestureRecognizerDirection.Up:
            print("up")
        case UISwipeGestureRecognizerDirection.Down:
            print("down")
        case UISwipeGestureRecognizerDirection.Left:
            print("left")
        case UISwipeGestureRecognizerDirection.Right:
            print("right")
        default:
            print("error")
        }
    }
    
    @objc private func tapAction(sener:UITapGestureRecognizer) {
        print("this is often code")
    }
    
    @objc private func pinchAction(sener:UIPinchGestureRecognizer) {
        print("this is often code")
        print(sener.scale)
        //self.ctrlView.transform = CGAffineTransformMakeScale(sener.scale, sener.scale)
    }
    
    @objc private func rotationAction(sener:UIRotationGestureRecognizer) {
        print("this is often code")
        //ctrlView.transform = CGAffineTransformMakeRotation(sener.rotation)
    }
    
    @objc private func panAction(sener:UIPanGestureRecognizer) {
        print("this is often code")
        //let point = sener.locationInView(self.ctrlView)
        //let w = self.ctrlView.bounds.size.width
        //let h = self.ctrlView.bounds.size.height
        //self.ctrlView.transform = CGAffineTransformTranslate(self.ctrlView.transform,point.x-w/2, point.y-h/2)
    }
    
    @objc private func longPressAction(sener:UILongPressGestureRecognizer) {
        print("this is often code")
    }
    
    @objc private func selfAction(sener:selfGesture) {
        print("this is self")
    }

}
