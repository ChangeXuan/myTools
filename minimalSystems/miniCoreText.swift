import UIKit
var W = UIScreen.mainScreen().bounds.size.width
var H = UIScreen.mainScreen().bounds.size.height
class ViewController: UIViewController {
    
    //更改颜色
    let dic = [NSFontAttributeName:UIFont.boldSystemFontOfSize(20),
               NSForegroundColorAttributeName:UIColor.redColor()]
    //下划线样式
    let dic2 = [NSFontAttributeName:UIFont.boldSystemFontOfSize(13),
                NSUnderlineStyleAttributeName:1]
    
    var testLabel:UILabel!
    
    let str = "这是一段用来测试的字符串this is a string for test 这是一段\n文字这\n是\n一\n段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("start")
        initView()
        partModify()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension ViewController {
    func initView() {
        testLabel = UILabel(frame:CGRectMake(W/2-150,0,300,200))
        testLabel.numberOfLines = 0
        testLabel.lineBreakMode = .ByWordWrapping
        testLabel.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(testLabel)
    }
}

extension ViewController {
    func allModify() {
        let attrStr = NSAttributedString(string: str,attributes: dic)
        testLabel.attributedText = attrStr
    }
    
    func partModify() {
        let mutableAttrStr = NSMutableAttributedString(string: str)
        //mutableAttrStr.addAttributes(dic, range: NSMakeRange(0,2))
        //mutableAttrStr.addAttributes(dic2, range: NSMakeRange(2,8))
        mutableAttrStr.addAttribute(NSLinkAttributeName, value: "www.baidu.com", range: NSMakeRange(0,5))
        testLabel.attributedText = mutableAttrStr
    }
}
