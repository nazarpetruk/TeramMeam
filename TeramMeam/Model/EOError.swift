//
//  EOError.swift
//  TeramMeam
//
//  Created by Nazar Petruk on 04/02/2020.
//  Copyright © 2020 Nazar Petruk. All rights reserved.
//

import Foundation

enum EOError: Error {
  case invalidURL(String)
  case invalidParameter(String, Any)
  case invalidJSON(String)
}
