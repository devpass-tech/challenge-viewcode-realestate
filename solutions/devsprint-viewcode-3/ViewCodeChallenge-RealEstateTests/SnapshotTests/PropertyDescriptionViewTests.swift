import XCTest
import SnapshotTesting

@testable import ViewCodeChallenge_RealEstate

class PropertyDescriptionViewTests: XCTestCase {
    func test_propertyDescriptionView_shouldSnapshot() {
        let propertyDescriptionView = PropertyDescriptionView()
        assertSnapshot(matching: propertyDescriptionView, as: .image)
    }
}
