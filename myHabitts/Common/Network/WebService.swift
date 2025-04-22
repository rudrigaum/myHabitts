//
//  WebService.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 17/04/25.
//

import Foundation

enum WebService {
    
    enum Endpoint: String {
        case base = "https://habitplus-api.tiagoaguiar.co"
        
        case postUser = "/users"
    }
    
    enum NetworkError {
        case badRequest
        case notFound
        case unauthorized
        case internalServerError
    }
    
    enum Result {
        case sucess(Data)
        case failure(NetworkError, Data?)
    }
    
    private static func completeUrl(path: Endpoint) -> URLRequest?  {
        guard let url = URL(string: "\(Endpoint.base.rawValue)\(path.rawValue)") else { return nil }
        
        return URLRequest(url: url)
    }
    
    private static func call<T: Encodable>(path: Endpoint, body: T,  completion: @escaping (Result) -> Void) {
        
        guard let jsonData = try? JSONEncoder().encode(body) else { return }
        
        guard var urlRequest = completeUrl(path: path) else { return }
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error)
                completion(.failure(.internalServerError, nil))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 400:
                    completion(.failure(.badRequest, data))
                    break
                case 200:
                    completion(.sucess(data))
                default:
                    break
                }
            }
            print(String(data: data, encoding: .utf8))
            print("response\n")
            print(response)
            
        }
        
        task.resume()
    }
    
    static func postUSer(request: SignUpRequest, completion: @escaping (Bool?, ErrorResponse?) -> Void ) {
        call(path: .postUser, body: request) { result in
            switch result {
            case .failure(let error, let data):
                if let data = data {
                    if error == .badRequest {
                        let decoder = JSONDecoder()
                        let response = try? decoder.decode(ErrorResponse.self, from: data)
                        completion(nil, response)
                    }
                }
                break
            case .sucess(let data):
                print(String(data: data, encoding: .utf8))
                break
            }
        }
    }
}
