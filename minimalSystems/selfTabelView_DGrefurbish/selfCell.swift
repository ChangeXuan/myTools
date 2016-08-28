import UIKit

var getcellH = 80
var testcontent1 = ["this is one me","this is two me","this is me"]
var testName = ["qzx","D-Day","zeroSwift"]
class selfCell:UITableViewCell
{
    var num:Int
    var testhead = UIImageView(image: UIImage(contentsOfFile:"child-selected"))
    var testname:UILabel = UILabel(frame: CGRect(x:78,y:8,width:230,height:21))
    var testcontent:UILabel!
    var testTextView:UITextView!
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
    }
    
    init(numdata:Int,reuseIdentifier cellId:String)
    {
        self.num = numdata
        super.init(style:UITableViewCellStyle.Default,reuseIdentifier:cellId)
        ftesthead()
        ftestname()
        //ftestcontent()
        ftestTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ftestTextView() {
        let flagnum = testcontent1[num].characters.count
        var H = 100
        H = (((flagnum-1) / 14) + 1) * 25
        getcellH = H+40
        testTextView = UITextView(frame: CGRect(x:78,y:30,width:230,height:H))
        testTextView.editable = false
        testTextView.showsVerticalScrollIndicator = false
        testTextView.showsHorizontalScrollIndicator = false
        testTextView.text = testcontent1[num]
        self.addSubview(testTextView)
    }
    
    func ftestcontent()
    {
        
        let flagnum = testcontent1[num].characters.count
        var H = 100
        //        if flagnum < 14
        //        {
        //            H = 25
        //        }
        //        else
        //        {
        //            H = 2*25
        //        }
        H = (((flagnum-1) / 14) + 1) * 25
        getcellH = H+40
        testcontent = UILabel(frame: CGRect(x:78,y:30,width:230,height:H))
        testcontent.text = testcontent1[num]
        testcontent.numberOfLines = 0
        testcontent.lineBreakMode = .ByWordWrapping
        self.addSubview(testcontent)
    }
    
    func ftestname()
    {
        testname.text = testName[num]
        testname.textColor = UIColor.orangeColor()
        self.addSubview(testname)
    }
    
    func ftesthead()
    {
        testhead.frame = CGRectMake(8, 8, 50, 50)
        self.testhead.image = UIImage(named: "dz")
        testhead.layer.masksToBounds = true
        testhead.layer.cornerRadius = 25
        self.addSubview(testhead)
    }
    
}
