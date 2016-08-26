/*
 saveImage().nameSave(image.jpg)
 */

import UIKit

class saveImage {
    
    func nameSave(imageName:String) {
        UIImageWriteToSavedPhotosAlbum(UIImage(named: imageName)!, self, #selector(saveImage.image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc private func image(image:UIImage,didFinishSavingWithError error:NSError?,contextInfo:UnsafePointer<Void>) {
        let e:NSError? = error
        if let ee = e {
            print(ee)
            UIAlertView(title: nil, message: "error", delegate: nil, cancelButtonTitle: "ok").show()
        }
        else {
            UIAlertView(title: nil, message: "save", delegate: nil, cancelButtonTitle: "ok").show()
        }
    }
    
}
