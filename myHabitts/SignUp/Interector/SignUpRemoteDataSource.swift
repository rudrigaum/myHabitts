//
//  SignUpRemoteDataSource.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 19/05/25.
//

import Foundation
import Combine

class SignUpRemoteDataSource {
    
    static var shared: SignUpRemoteDataSource  = SignUpRemoteDataSource()
    
    private init() {
        
    }
    
    func postUser(request: SignUpRequest) -> Future<Bool, AppError> {
        return Future { promise in
            WebService.call(path: .postUser, method: .post, body: request) { result in
              switch result {
                case .failure(let error, let data):
                  if let data = data {
                    if error == .badRequest {
                      let decoder = JSONDecoder()
                      let response = try? decoder.decode(ErrorResponse.self, from: data)
                        promise(.failure(AppError.response(message: response?.detail ?? "Erro interno no servidor")))
                    }
                  }
                  break
                case .success(let data):
                  promise(.success(true))
                  break
              }
            }
        }

    }
}
