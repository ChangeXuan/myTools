/*
 使用google计算方法，通过两点的经纬度来计算两点的距离
 la->纬度    ln->经度
 let dis = getDistance(lat1, lng1: lng1, lat2: lat2, lng2: lng2)
 */

import UIKit

class lalongDisToWorldDis {
    func rad(d:Double) -> Double {
        return d*M_PI/180.0
    }
    
    func getDistance(lat1:Double,lng1:Double,lat2:Double,lng2:Double) -> Double{
        let radLat1 = rad(lat1)
        let radLat2 = rad(lat2)
        let a = radLat1-radLat2
        let b = rad(lng1)-rad(lng1)
        
        var s = 2*asin(sqrt(pow(sin(a/2.0), 2)+cos(radLat1)*cos(radLat2)*pow(sin(b/2.0),2)))
        
        s *= 6378.137
        s = round(s*10000)/10000
        
        return s
    }
}
