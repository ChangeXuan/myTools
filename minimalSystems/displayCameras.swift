import UIKit
import AVFoundation

class displayCamera: UIViewController{
    
    //视频捕捉会话。它是input和output的桥梁。它协调input到output的数据传输
    let captureSession = AVCaptureSession()
    
    var camera:AVCaptureDevice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hi")
        
        initCamera(.Back)//使用后置摄像头.Back
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initCamera(position:AVCaptureDevicePosition) {
       //视频输入设备
        //let videoDevice = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo)
//        for item in videoDevice as! [AVCaptureDevice] {
//            if item.position == position {
//                camera = item
//            }
//        }
        let videoDevice = AVCaptureDeviceDiscoverySession.init(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: position)
        for item in videoDevice!.devices{
            if item.position == position {
                self.camera = item
            }
        }
        
        //设置视频清晰度(可以默认)
        //captureSession.sessionPreset = AVCaptureSessionPreset640x480
        
        //添加视频输入设备
        if let videoInput = try? AVCaptureDeviceInput(device: self.camera) {
            self.captureSession.addInput(videoInput)
        }
        
        //使用AVCaptureVideoPreviewLayer可以将摄像头的拍摄的实时画面显示在viewController(屏幕)上
        let videoLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        videoLayer?.frame = self.view.bounds
        videoLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.view.layer.addSublayer(videoLayer!)
        
        //启动session会话
        self.captureSession.startRunning()
    }
}
