//
//  NameDescribable+Extension.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 24/10/21.
//

import Foundation
import UIKit

//protocol ClassName {}

extension NSObject {
  static var className: String {
    let texto = String(describing: type(of: self))
    return texto
  }
}
