import XCTest
@testable import AdventOfCode1

class ConverterTests: XCTestCase {

    var sut : Converter!
    
    override func setUp() {
        super.setUp()
        sut = Converter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testThatStringConvertsToArray() {
        
        let converted = sut.convertToArrayFrom(string: "1,2,3")
        
        XCTAssertEqual(converted.count, 3)
    }
    
    func testThatWhiteSpaceIsRemoved() {

        let converted = sut.convertToArrayFrom(string: "1 ,2 , 3")
        
        XCTAssertEqual(converted.first!, "1")
    }
    
}
