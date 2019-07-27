//
//  main.swift
//  QualityControl
//
//  Created by Артём Кармазь on 7/18/19.
//  Copyright © 2019 Артём Кармазь. All rights reserved.
//

import Foundation

class PthreadQosTest {
    func test() {
        var thread = pthread_t(bitPattern: 0)
        var atr = pthread_attr_t()
        
        pthread_attr_init(&atr)
//        pthread_set_qos_class_self_np(QOS_CLASS_DEFAULT, 0)
        pthread_attr_set_qos_class_np(&atr, QOS_CLASS_USER_INTERACTIVE, 0)
        pthread_create(&thread, &atr, { (pointer) -> UnsafeMutableRawPointer? in
            print("It's test C Thread (1)")
            return nil
        }, nil)
    }
}


// Opera start

//@param __qos_class
//* On output, a QOS class value:
//*    - QOS_CLASS_USER_INTERACTIVE
//*    - QOS_CLASS_USER_INITIATED
//*    - QOS_CLASS_DEFAULT
//*    - QOS_CLASS_UTILITY
//*    - QOS_CLASS_BACKGROUND
//*    - QOS_CLASS_UNSPECIFIED
//* This value may be NULL in which case no value is returned.

//public enum QualityOfService : Int {
//
//    case userInteractive
//
//    case userInitiated
//
//    case utility
//
//    case background
//
//    case default // что-то среднее между 2 и 3 кейсом, по умолчанию, выставить нельзя
//}

var pthreadQosTest = PthreadQosTest()
pthreadQosTest.test()
print(readLine() ?? "rrr")
