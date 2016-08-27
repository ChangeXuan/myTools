import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollV = UIScrollView(frame:CGRectMake(10,50,300,600))
        scrollV.delegate = self
        scrollV.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(scrollV)
        
        let img = UIImageView(image: UIImage(named: "dz.jpg"))
        scrollV.addSubview(img)
        //设置滑动范围
        scrollV.contentSize = img.bounds.size
        
        //设置缩放尺寸
        scrollV.minimumZoomScale = 0.5
        scrollV.maximumZoomScale = 2
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("scroll ing")
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("leave view")
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("stop move")
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews[0] as UIView
    }
}
