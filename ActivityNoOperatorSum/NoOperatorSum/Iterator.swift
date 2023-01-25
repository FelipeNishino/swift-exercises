//
//  Iterator.swift
//  NoOperatorSum
//
//  Created by Felipe Nishino on 11/09/20.
//  Copyright © 2020 Leo Takuno. All rights reserved.
//

import XCTest

class Iterator: XCTestCase {
    func noOperatorSum(_ a: Int, _ b: Int) -> Int {
        var sum : Int?
        var and : Int?
        var xorResult : Int?
        
        while and == nil || and!.nonzeroBitCount > 0  {
            if sum == nil {
                sum = a ^ b
                and = a & b
            }
            else {
                xorResult = sum!
                sum = sum! ^ and!
                and = xorResult! & and!
            }
            
            if (and!.nonzeroBitCount > 0) {
                and = and! << 1
            }
        }
        
        return sum!
    }
    
    func test01() throws {
        let a: Int = 2
        let b: Int = 7
        
        let result: Int = noOperatorSum(a, b)
        XCTAssert(result == 9, "obtained \(result)")
    }
    
    func test02() throws {
        let a: Int = 6
        let b: Int = 6
        
        let result: Int = noOperatorSum(a, b)
        XCTAssert(result == 12, "obtained \(result)")
    }
    
    func test03() throws {
        let a: Int = 1
        let b: Int = 4
        
        let result: Int = noOperatorSum(a, b)
        XCTAssert(result == 5, "obtained \(result)")
    }
    
    func test04() throws {
        let a: Int = 9
        let b: Int = 7
        
        let result: Int = noOperatorSum(a, b)
        XCTAssert(result == 16, "obtained \(result)")
    }
    
    func test05() throws {
        let a: Int = 1
        let b: Int = 3
        
        let result: Int = noOperatorSum(a, b)
        XCTAssert(result == 4, "obtained \(result)")
    }
    
    func test06() throws {
        let a: Int = 11
        let b: Int = 1
        
        let result: Int = noOperatorSum(a, b)
        XCTAssert(result == 12, "obtained \(result)")
    }
}
