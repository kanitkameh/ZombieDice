import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    //Here we list all the tests to be run
    return [
        testCase(ZombieDiceTests.allTests),
        testCase(DicePoolTest.allTests)
    ]
}
#endif
