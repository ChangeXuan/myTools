```
/*
导入HealthKit.framdwork

 let test = sleepMonitor()
 test.sleepInit()   //一些配置的初始化
 
 test.saveSleepAnalysis(startTime,endTime:endTime)  //保存数据startTime = NSDate() endTime:NSDate()
 test.retrieveSleepAnalysis()   //获取数据
 */
 
 import UIKit
 import HealthKit
 
class sleepMonitor {
    private let healthStore = HKHealthStore()
    
    func sleepInit() {
        let typestoRead = Set([
            HKObjectType.categoryTypeForIdentifier(HKCategoryTypeIdentifierSleepAnalysis)!
            ])
        
        let typestoShare = Set([
            HKObjectType.categoryTypeForIdentifier(HKCategoryTypeIdentifierSleepAnalysis)!
            ])
        
        self.healthStore.requestAuthorizationToShareTypes(typestoShare, readTypes: typestoRead) { (success, error) -> Void in
            if success == false {
                NSLog(" Display not allowed")
            }
        }
    }
    
    func saveSleepAnalysis(startTime:NSDate,endTime:NSDate) {
        if let sleepType = HKObjectType.categoryTypeForIdentifier(HKCategoryTypeIdentifierSleepAnalysis) {
            let object = HKCategorySample(type:sleepType, value: HKCategoryValueSleepAnalysis.InBed.rawValue,
                                          startDate: startTime, endDate:endTime)
            healthStore.saveObject(object, withCompletion: { (success, error) -> Void in
                if error != nil {
                    return
                }
                
                if success {
                    print("My new data was saved in Healthkit")
                } else {
                    // It was an error again
                }
                
            })

            let object2 = HKCategorySample(type:sleepType, value: HKCategoryValueSleepAnalysis.Asleep.rawValue,
                                           startDate: startTime, endDate:endTime)

            healthStore.saveObject(object2, withCompletion: { (success, error) -> Void in
                
                if error != nil {
                    return
                }
                
                if success {
                    print("My new data (2) was saved in Healthkit")
                    
                } else {
                    // It was an error again
                }
            })
        }
    }
    
    func retrieveSleepAnalysis() {
        if let sleepType = HKObjectType.categoryTypeForIdentifier(HKCategoryTypeIdentifierSleepAnalysis) {
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            
            let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 30,
                                      sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                if error != nil {
                    return
                }
                
                if let result = tmpResult {
                    
                    for item in result {
                        if let sample = item as? HKCategorySample {
                            
                            let value = (sample.value == HKCategoryValueSleepAnalysis.InBed.rawValue) ? "InBed" : "Asleep"
    
                            print("Healthkit sleep: \(sample.startDate) \(sample.endDate) - value: \(value)")
                        }
                    }
                }
            }
            healthStore.executeQuery(query)
        }
    }
}
```
