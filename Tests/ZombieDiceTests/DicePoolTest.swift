
import XCTest
import class Foundation.Bundle
@testable import ZombieDice
final class DicePoolTest: XCTestCase {
    func given_notEmptyDicePool_whenDrawLessThanMax_ThenReturnDice() throws { 
        let pool = DicePool();
        XCTAssertNotEqual(pool.drawDice(count: 13)[12], nil)
    }
    func given_notEmptyDicePool_whenDrawMoreThanMax_ThenReturnSomeDicesNil() throws { 
        let pool = DicePool();
        XCTAssertEqual(pool.drawDice(count: 14)[13], nil)
    }
    static var allTests = [
        ("given_notEmptyDicePool_whenDrawMoreThanMax_ThenReturnSomeDicesNil",given_notEmptyDicePool_whenDrawMoreThanMax_ThenReturnSomeDicesNil),
        ("given_notEmptyDicePool_whenDrawLessThanMax_ThenReturnDice",given_notEmptyDicePool_whenDrawLessThanMax_ThenReturnDice)
    ]

}