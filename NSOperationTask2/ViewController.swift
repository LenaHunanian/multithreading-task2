//
//  ViewController.swift
//  NSOperationTask2
//
//  Created by Lena Hunanian on 16.07.25.
//

import UIKit

class ViewController: UIViewController {
    let operationQueue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let opA = BlockOperation {
            print("Operation \"A\" started")
            for _ in 0..<1000000 {
                // do nothing
            }
            print("Operation \"A\" finished")
            
        }
        let opB = BlockOperation {
            print("Operation \"B\" started")
            for _ in 0..<1000000 {
                // do nothing
            }
            print("Operation \"B\" finished")
        }
        let opC = BlockOperation {
            print("Operation \"C\" started")
            for _ in 0..<1000000 {
                // do nothing
            }
            print("Operation \"C\" finished")
        }
        let opD = BlockOperation {
            print("Operation \"D\" started")
            for _ in 0..<1000000 {
                // do nothing
            }
            print("Operation \"D\" finished")
        }
        let opE = BlockOperation {
            print("Operation \"E\" started")
            for _ in 0..<1000000 {
                // do nothing
            }
            print("Operation \"E\" finished")
        }
        
        
        
        //MARK: -  test 1 (maxConcurrentOperationCount = 6 )
        //
        //        operationQueue.maxConcurrentOperationCount = 6
        //        operationQueue.addOperations([opA, opB, opC, opD, opE], waitUntilFinished: false)
        
        //MARK:  CONCLUSION
        //output: started and finished in unpredictable order
        
        
        
        
        
        
        //MARK: - test 2 (maxConcurrentOperationCount = 2)
        
        //        operationQueue.maxConcurrentOperationCount = 2
        //        operationQueue.addOperations([opA, opB, opC, opD, opE], waitUntilFinished: false)
        
        //MARK: CONCLUSION
        //output: "maxConcurrentOperationCount = 2" sets operations limit to 2, so only 2 operations start at a time simultaneously, A and B operations start first, then , it doesn't depend exactly which one finishes first , the other operation starts, the logic remains the same for completion
        
        
        
        
        
        
        //MARK: - test 3 (set the dependencies: B depends on C, D depends on B and compare the result)
        //    opB.addDependency(opC)
        //    opD.addDependency(opB)
        //
        //    operationQueue.addOperations([opB, opC, opD], waitUntilFinished: false)
        //
    
    
    //MARK: CONCLUSION
    //output: because of the set dependencies, C started first, when finished, B started ,and when B finished, D started and finished, their execution depended on each other.
    
    
    
    //MARK: - test 4(operation A's priority = low)
        opA.queuePriority = .low
        operationQueue.addOperations([opA, opB, opC, opD, opE], waitUntilFinished: false)
        
        //MARK: CONCLUSION
        //output: A started in the last because its priority was set to low, finishing was not depending on that though.
    }
}
