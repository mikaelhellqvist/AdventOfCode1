import XCTest

@testable import AdventOfCode1

class PathFinderTests: XCTestCase {
    
    var sut : PathFinder!
    
    override func setUp() {
        super.setUp()
        sut = PathFinder(pathArray:[""])
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testThatAnErrorIsThrownWhenTurnRotationIsWrong() {
        
        do {
            _ = try sut.updateDirection(turnRotation: "F")
            XCTFail()
        } catch {
            XCTAssertNotNil(error)
        }
        
    }
    
    func testThatNewDirectionIsUpdatedClockWiseIfTurningRight() {
        let newDirection = try! sut.updateDirection(turnRotation: "R")
        
        XCTAssertEqual(newDirection, .East)
    }
    
    func testThatNewDirectionIsUpdatedAntiClockWiseIfTurningLeft() {
        let newDirection = try! sut.updateDirection(turnRotation: "L")
        
        XCTAssertEqual(newDirection, .West)
    }
    
    func testThatNewDirectionIsUpdatedAntiClockWiseWhenFullyRotated() {
        _ = try! sut.updateDirection(turnRotation: "L")
        _ = try! sut.updateDirection(turnRotation: "L")
        _ = try! sut.updateDirection(turnRotation: "L")
        let newDirection = try! sut.updateDirection(turnRotation: "L")
        
        XCTAssertEqual(newDirection, .North)
    }
    
    func testThatNewDirectionIsUpdatedClockWiseWhenFullyRotated() {
        _ = try! sut.updateDirection(turnRotation: "R")
        _ = try! sut.updateDirection(turnRotation: "R")
        _ = try! sut.updateDirection(turnRotation: "R")
        let newDirection = try! sut.updateDirection(turnRotation: "R")
        
        XCTAssertEqual(newDirection, .North)
    }
    
    func testThatNewDirectionIsUpdatedClockWiseIfSameRotationTwice() {
        _ = try! sut.updateDirection(turnRotation: "R")
        let newDirection = try! sut.updateDirection(turnRotation: "R")
        XCTAssertEqual(newDirection, .South)
    }
    
    func testR2_L3_shouldBe_5() {
        sut = PathFinder(pathArray:["R2","L3"])
        let numberOfSteps = sut.calculateDistance()
        
        XCTAssertEqual(numberOfSteps, 5)
    }
    
    func testR2_R2_R2_shouldBe_2() {
        sut = PathFinder(pathArray:["R2","R2","R2"])
        let numberOfSteps = sut.calculateDistance()
        
        XCTAssertEqual(numberOfSteps, 2)
    }
    
    func testR5_L5_R5_R3_shouldBe_12() {
        sut = PathFinder(pathArray:["R5","L5","R5","R3"])
        let numberOfSteps = sut.calculateDistance()
        
        XCTAssertEqual(numberOfSteps, 12)
    }
    
    func testL5_R5_L5_L3_shouldBe_12() {
        sut = PathFinder(pathArray:["L5","R5","L5","L3"])
        let numberOfSteps = sut.calculateDistance()
        
        XCTAssertEqual(numberOfSteps, 12)
    }
    
    func testL5_L5_L5_L5_shouldBe_0() {
        sut = PathFinder(pathArray:["L5","L5","L5","L5"])
        let numberOfSteps = sut.calculateDistance()
        
        XCTAssertEqual(numberOfSteps, 0)
    }
    
    func testR5_R5_R5_shouldBe_5() {
        sut = PathFinder(pathArray:["R5","R5","R5"])
        let numberOfSteps = sut.calculateDistance()
        
        XCTAssertEqual(numberOfSteps, 5)
    }
    
    func testR5_R5_R5_R5_R5_R5_shouldBe_5() {
        sut = PathFinder(pathArray:["R5","R5","R5","R5","R5"])
        let numberOfSteps = sut.calculateDistance()
        
        XCTAssertEqual(numberOfSteps, 5)
    }
    
    func testL5_L5_L5_L5_R5_R5_R5_R5_shouldBe_0() {
        sut = PathFinder(pathArray:["L5","L5","L5","L5","R5","R5","R5","R5"])
        let numberOfSteps = sut.calculateDistance()
        
        XCTAssertEqual(numberOfSteps, 0)
    }
    
    func testL5_L5_L5_L5_L5shouldBe_5() {
        sut = PathFinder(pathArray:["L5","L5","L5","L5","L5"])
        let numberOfSteps = sut.calculateDistance()
        
        XCTAssertEqual(numberOfSteps, 5)
    }
    
    func testL5_L5_L5_L5_L5_L5shouldBe_10() {
        sut = PathFinder(pathArray:["L5","L5","L5","L5","L5","L5"])
        let numberOfSteps = sut.calculateDistance()
        
        XCTAssertEqual(numberOfSteps, 10)
    }
}
