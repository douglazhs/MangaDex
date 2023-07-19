//
//  TaskElement.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 13/07/23.
//

import Foundation
import Alamofire

public enum TaskElement {
    case requestPlain
    case requestParameters(
        parameters: [String: Any],
        encoding: ParameterEncoding
    )
}
