import UIKit
import MapKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

class ViewController: UIViewController{
    
    var startLabel = UILabel()
    var startInput:newTextField!
    var endLabel = UILabel()
    var endInput:newTextField!
    var okButton:UIButton!
    
    //地理编码
    lazy var geoCoder = CLGeocoder()
    
    let centerX = SCREEN_WIDTH/2-50

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController {
    func initView() {
        startLabel = scoreLabel(centerX-100, y: 200, str: "startPoint")
        endLabel = scoreLabel(centerX-100, y: 350, str: "endPoint")
        
        startInput = scoreInput(centerX, y: 200, str: "Input Start")
        endInput = scoreInput(centerX, y: 350, str: "Input End")
        
        okButton = UIButton(frame:CGRectMake(80,400,150,30))
        okButton.setTitle("ok", forState: .Normal)
        okButton.backgroundColor = UIColor.cyanColor()
        okButton.addTarget(self, action: #selector(okAction(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(okButton)
    }
    
    func scoreLabel(x:CGFloat,y:CGFloat,str:String) -> UILabel {
        let selfLabel = UILabel(frame:CGRectMake(x,y,100,30))
        selfLabel.text = str
        selfLabel.font = UIFont.systemFontOfSize(18)
        self.view.addSubview(selfLabel)
        return selfLabel
    }
    
    func scoreInput(x:CGFloat,y:CGFloat,str:String) ->newTextField {
        let selfInput = newTextField(frame:CGRectMake(x,y,100,30))
        selfInput.placeholder = str
        selfInput.borderStyle = .RoundedRect
        //selfInput.tintColor = UIColor.cyanColor()
        selfInput.clearButtonMode = .Always
        self.view.addSubview(selfInput)
        return selfInput
    }
}

extension ViewController {
    func okAction(button:UIButton) {
        let startStr = startInput.text
        let endStr = endInput.text
        if (startStr == nil||startStr?.characters.count == 0||endStr == nil||endStr?.characters.count == 0) {
            print("请正确输入您要输入的地址")
            return;
        }
        okStartEnd(startStr!,endStr: endStr!)
    }
    
    func okStartEnd(startStr:String,endStr:String) {
        //地理编码，通过地理名称来获得经纬度
        geoCoder.geocodeAddressString(startStr, completionHandler: {
            (placemarks:[CLPlacemark]?, error:NSError?) -> Void in
            if (placemarks!.count == 0||error != nil) {
                print("错误：\(error!.localizedDescription))")
                return
            }
            
            let startPlace = placemarks![0]
            
            self.geoCoder.geocodeAddressString(endStr, completionHandler: {
                (placemarks:[CLPlacemark]?,error:NSError?) -> Void in
                if (placemarks!.count == 0||error != nil) {
                    print("错误：\(error!.localizedDescription))")
                    return
                }
                let endPlace = placemarks![0]
                self.startToEnd(startPlace, end: endPlace)
            })
        })
    }
    
    func startToEnd(start:CLPlacemark,end:CLPlacemark) {
        //创建起点
        let startMark = MKPlacemark(placemark: start)
        //创建终点
        let endMark = MKPlacemark(placemark: end)
        
        //设置起点位置
        let startItem = MKMapItem(placemark: startMark)
        //设置终点位置
        let endItem = MKMapItem(placemark: endMark)
        
        //起点,终点数组
        let items = [startItem,endItem]
        
        let dictM:NSMutableDictionary = NSMutableDictionary()
        //导航模式(驾车,步行)
        dictM[MKLaunchOptionsDirectionsModeKey] = MKLaunchOptionsDirectionsModeDriving;
        //地图显示的模式
        dictM[MKLaunchOptionsMapTypeKey] = MKMapType.Standard as? AnyObject
        
        let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        
        MKMapItem.openMapsWithItems(items, launchOptions: options)
        
    }
    
}

class newTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 5)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 5)
    }
}
