import UIKit
import CoreLocation
import MapKit
var w1 = UIScreen.mainScreen().bounds.size.width/2
var h1 = UIScreen.mainScreen().bounds.size.height/2
//la->纬度    ln->经度
class mapLocation: UIViewController {
    
    lazy var mapView:MKMapView = {
        let mapView = MKMapView(frame: self.view.frame)
        mapView.mapType = .Standard
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.Follow//.FollowWithHeading
        mapView.showsUserLocation = true    //显示定位点
        mapView.userInteractionEnabled = true
        mapView.showsBuildings = true
        return mapView
    }()
    
    var locateManager = CLLocationManager()
    
    var saveLocation:MKCoordinateRegion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        
        if CLLocationManager.locationServicesEnabled() {
            if #available(iOS 8.5, *) {
                self.locateManager.requestAlwaysAuthorization()
            } else {
                // Fallback on earlier versions
            }
        }
        
        locateManager.desiredAccuracy = kCLLocationAccuracyBest//定位精准度
        locateManager.startUpdatingLocation()//开始定位
        
        let button = UIButton(frame: CGRectMake(20,20,80,40))
        button.backgroundColor = UIColor.cyanColor()
        button.setTitle("displayNear", forState: .Normal)
        button.addTarget(self, action: #selector(mapLocation.find), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }
}

extension mapLocation:MKMapViewDelegate {
    
    //位置更新时调用
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let worldMess = userLocation.location!.coordinate
        findSelf(worldMess)
    }
    //地图加载完成
    func mapViewDidFinishRenderingMap(mapView: MKMapView, fullyRendered: Bool) {
    }
    //地图加载失败
    func mapViewDidFailLoadingMap(mapView: MKMapView, withError error: NSError) {
        print("error:\(error)")
    }
}

extension mapLocation {
    func findSelf(center:CLLocationCoordinate2D) {
        let span = MKCoordinateSpanMake(0.002, 0.002)
        let region = MKCoordinateRegion(center: center, span:span)
        saveLocation = region
        mapView.setRegion(region, animated: true)
        
    }
    
    func find() {
        print("near")
        mapView.setRegion(saveLocation, animated: true)
    }

}
