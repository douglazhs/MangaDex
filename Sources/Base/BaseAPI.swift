//
//  BaseAPI.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 13/07/23.
//

import Foundation
import Alamofire


public class BaseAPI<T: TargetType> {
    /// Build parameters of request
    /// - Parameter task: Type of task
    /// - Returns: Parameters of the request
    private func buildParams(task: TaskElement) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(let parameters, let encoding):
            return(parameters, encoding)
        }
    }
    
    /// Fetch data from API
    /// - Parameters:
    ///   - target: Choosen target to fetch
    ///   - responseClass: Type of object to decode
    ///   - completion: Request Result
    public func fetchData<M: Decodable>(
        target: T,
        responseClass: M.Type,
        completion: @escaping(Result<M, Error>) -> Void
    ) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParams(task: target.task)
        
        AF.request(
            target.baseURL + target.path,
            method: method,
            parameters: parameters.0,
            encoding: parameters.1,
            headers: headers
        )
        .validate(statusCode: 200..<500)
        .responseJSON { response in
            switch response.result {
            case .success(_):
                do {
                    let jsonResponse = try response.result.get()
                    let theJSONData = try JSONSerialization.data(
                        withJSONObject: jsonResponse,
                        options: []
                    )
                    let responseObj = try JSONDecoder().decode(
                        M.self,
                        from: theJSONData
                    )
                    completion(.success(responseObj))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}

