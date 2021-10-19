//
//  ViewCodeChallenge_RealEstateTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Dairan on 18/10/21.
//

import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate
import XCTest

class ViewCodeChallenge_RealEstateTests: XCTestCase {

  let status: Bool = false

  func test_withTextLessThanFiveLines() {
    let frame = CGRect(x: 0, y: 0, width: 434, height: 200)

    let title: String = "Descrição"
    let description: String = "Casamentiss faiz malandris se pirulitá. Delegadis gente finis, bibendum egestas augue arcu ut est."
    let textButton: String = "Ver mais"

    let sutViewModel = PropertyDescriptionViewViewModel(title: title,
                                                        description: description,
                                                        textButton: textButton)

    let sut = PropertyDescriptionView(frame: frame)
    sut.set(with: sutViewModel)

    isRecording = status

    assertSnapshot(matching: sut, as: .image)
    assertSnapshot(matching: sut, as: .recursiveDescription)
  }

  func test_withTextGreaterThanFiveLines() {
    let frame = CGRect(x: 0, y: 0, width: 434, height: 200)

    let title: String = "Descrição"
    let description: String = "Mussum Ipsum, cacilds vidis litro abertis. Nec orci ornare consequat. Praesent lacinia ultrices consectetur. Sed non ipsum felis. Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose. A ordem dos tratores não altera o pão duris. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! Viva Forevis aptent taciti sociosqu ad litora torquent. In elementis mé pra quem é amistosis quis leo. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis. Casamentiss faiz malandris se pirulitá."
    let textButton: String = "Ver mais"

    let sutViewModel = PropertyDescriptionViewViewModel(title: title,
                                                        description: description,
                                                        textButton: textButton)

    let sut = PropertyDescriptionView(frame: frame)
    sut.set(with: sutViewModel)

    isRecording = status

    assertSnapshot(matching: sut, as: .image)
    assertSnapshot(matching: sut, as: .recursiveDescription)
  }
}
