//
//  EmptyViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Tatiana Rico on 08/12/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class EmptyViewSnapshotTests: XCTestCase {
    
    func testEmtyView() {
        let emptyView = EmptyView()
        
        let titleMsg: String = "Not listings found"
        let msg: String = "Search fot cities and neighborhoods using tge search bar above"
        
        emptyView.updateTextView(msg: EmptyViewConfiguration(titleInformation: titleMsg, msgInformation: msg))
        
        assertSnapshot(matching: emptyView, as: Snapshotting.image(size: CGSize(width: 600, height: 500)), record: false)
    }
}
