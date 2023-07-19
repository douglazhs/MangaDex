//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 13/07/23.
//

import Foundation

public protocol TargetType {
    var baseURL: String { get }
        
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var task: TaskElement { get }
    
    var headers: [String: String]? { get }
}
