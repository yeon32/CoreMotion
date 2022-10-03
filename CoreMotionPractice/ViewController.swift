//
//  ViewController.swift
//  CoreMotionPractice
//
//  Created by 김정연 on 2022/09/22.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        set.resetMaxValue()
        
        
        //얼마만큼 자주 데이터를 수집할 것인지 설정 (1초에 한번 = 1)
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.gyroUpdateInterval = 0.2
        
        //수집 시작 (accelerometer & gyroscope)
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(accelerometerData: CMAccelerometerData!, error: Error!) -> Void in
            self.outputAccelerationData(accelerometerData.acceleration)
            if (error != nil ) {
                print("\(error)")
            }
        })
        
        motionManager.startGyroUpdates(to: OperationQueue.current!, withHandler: {(gyroData: CMGyroData!, error: Error!) -> Void in
            self.outputRotationData(gyroData.rotationRate)
            if(error != nil) {
                print("\(error)")
            }
        })
        
        
        super.viewDidLoad()
        
    }
    
    func outputAccelerationData(_accerleration: CMAcceleration) {
        accX?.text = "\(acceleration.x).2fg"
        
        if fabs(acceleration.x) > fabs(currentMaxAccelX) {
            currentMaxAccelX = acceleration.x
        }
        
        accY?.text = "\(acceleration.y).2fg"
        
        if fabs(acceleration.y) > fabs(currentMaxAccelY) {
            currentMaxAccelY = acceleration.y
        }
        
        accZ?.text = "\(acceleration.z).2fg"
        
        if fabs(acceleration.z) > fabs(currentMaxAccelZ) {
            currentMaxAccelZ = acceleration.z
        }
        
        maxAccX?.text = "\(currentMaxAccelX)" . 2f"
        maxAccY?.text = "\(currentMaxAccelY)" . 2f"
        maxAccZ?.text = "\(currentMaxAccelZ)" . 2f"
    
    }
    
    func outputRotationData(_ rotation; CMRotationRate) {
        rotX?.text = "\(rotation.x).2fr/s"
        
        if fabs(rotation.x) > fabs(currentMaxRotX) {
            currentMaxRotX = rotation.x
        }
        
        rotY?.text = "\(rotation.y).2fr/s"
        
        if fabs(rotation.y) > fabs(currentMaxRotY) {
            currentMaxRotY = rotation.y
        }
        
        rotZ?.text = "\(rotation.z).2fr/s"
        
        if fabs(rotation.z) > fabs(currentMaxRotZ) {
            currentMaxRotZ = rotation.z
        }
        
        maxRotX?.text = "\(currentMaxRotX)" . 2f"
        maxRotY?.text = "\(currentMaxRotY)" . 2f"
        maxRotZ?.text = "\(currentMaxRotZ)" . 2f"
        
    }
}




