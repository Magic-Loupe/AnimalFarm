import XCTest
@testable import AnimalFarm

final class AnimalFarmTests: XCTestCase {
    func testAnimalFarm() throws {
        let _ = AnimalFarmModule()
        // make sure the localURL is correctly able to load a resource
        let js = try Data(contentsOf: XCTUnwrap(AnimalFarmModule.localModuleRoot).appendingPathComponent("AnimalFarmView.js"))
        XCTAssertNotEqual(0, js.count)
    }
}
