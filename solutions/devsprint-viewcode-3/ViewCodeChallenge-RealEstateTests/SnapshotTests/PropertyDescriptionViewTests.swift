import XCTest
import SnapshotTesting

@testable import ViewCodeChallenge_RealEstate

class PropertyDescriptionViewTests: XCTestCase {
    func test_propertyDescriptionView_shouldSnapshot() {
        let propertyDescriptionView = PropertyDescriptionView()
        propertyDescriptionView.configure(with: PropertyDescriptionViewConfiguration(description: "Lorem ipsum Dolor"))
        
        let result = verifySnapshot(matching: propertyDescriptionView,
                                    as: Snapshotting.image(size: CGSize(width: 400, height: 80.0)),
                                    named: "PropertyDescriptionView",
                                    testName: "Property Description")
        XCTAssertNil(result)
    }
}
