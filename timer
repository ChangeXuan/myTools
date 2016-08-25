/*
 继承timerToolDelegate协议
 接口函数会按自定义的时间进行调用
 var test = timerTool()
 test.delegate = self   //取得协议代理
 test.timerStart(0.1)  //计时开始，每过0.1秒调用更新函数
 test.timerEnd()    //计时结束
 */

import UIKit

protocol timerToolDelegate {
    func timeUpdate(strAry:[String])
}

class timerTool{
    
    private var startTime = NSTimeInterval()
    private var timer:NSTimer = NSTimer()
    private var endTime: NSDate!
    private var alarmTime: NSDate!
    
    private var timeAry:[String] = []
    
    var delegate:timerToolDelegate!
    
    func timeStart(intervalTime:NSTimeInterval) {
        alarmTime = NSDate()
        if (!timer.valid) {
            let aSelector : Selector = #selector(self.timeUpdate)
            timer = NSTimer.scheduledTimerWithTimeInterval(intervalTime, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
        print("start")
    }
    
    func timeEnd() {
        endTime = NSDate()
        timer.invalidate()
        print("end")
    }
    
    @objc func timeUpdate(){
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        let hours = UInt8(elapsedTime / 3600.0)
        elapsedTime -= (NSTimeInterval(hours) * 3600)
        
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        let fraction = UInt8(elapsedTime * 100)
        
        let strHours = String(format: "%02d", hours)//hour
        let strMinutes = String(format: "%02d", minutes)//min
        let strSeconds = String(format: "%02d", seconds)//s
        let strFraction = String(format: "%02d", fraction)//ms
        
        timeAry.removeAll()
        timeAry.append(strHours)
        timeAry.append(strMinutes)
        timeAry.append(strSeconds)
        timeAry.append(strFraction)
        delegate.timeUpdate(timeAry)
    }
    
}
