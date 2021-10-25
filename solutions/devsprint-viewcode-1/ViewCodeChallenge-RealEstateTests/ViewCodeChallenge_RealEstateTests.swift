//
//  ViewCodeChallenge_RealEstateTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Dairan on 19/10/21.
//

import XCTest
@testable import ViewCodeChallenge_RealEstate
import SnapshotTesting

class ViewCodeChallenge_RealEstateTests: XCTestCase {

  let recordNewImagem: Bool = false

  func test_withTextLessThanFiveLines() {

    let title: String = "Descrição"
    let description: String = "Casamentiss faiz malandris se pirulitá. Delegadis gente finis, bibendum egestas augue arcu ut est."
    let textButton: String = "Ver mais"

    let sutViewModel = PropertyDescriptionViewViewModel(title: title,
                                                        description: description,
                                                        textButton: textButton)

    let sut = PropertyDescriptionView(with: sutViewModel)

    isRecording = recordNewImagem

    assertSnapshot(matching: sut, as: .image(size: .init(width: 434, height: 200)))
    assertSnapshot(matching: sut, as: .recursiveDescription)
  }

  func test_withTextGreaterThanFiveLines() {

    let title: String = "Descrição"
    let description: String = "Mussum Ipsum, cacilds vidis litro abertis. Nec orci ornare consequat. Praesent lacinia ultrices consectetur. Sed non ipsum felis. Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose. A ordem dos tratores não altera o pão duris. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! Viva Forevis aptent taciti sociosqu ad litora torquent. In elementis mé pra quem é amistosis quis leo. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis. Casamentiss faiz malandris se pirulitá."
    let textButton: String = "Ver mais"

    let sutViewModel = PropertyDescriptionViewViewModel(title: title,
                                                        description: description,
                                                        textButton: textButton)

    let sut = PropertyDescriptionView(with: sutViewModel)

    isRecording = recordNewImagem

    assertSnapshot(matching: sut, as: .image(size: .init(width: 434, height: 200)))
    assertSnapshot(matching: sut, as: .recursiveDescription)
  }
}

