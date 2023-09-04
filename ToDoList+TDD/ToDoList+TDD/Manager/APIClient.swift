//
//  APIClient.swift
//  ToDoList+TDD
//
//  Created by darmaraht on 1/9/23.
//

import Foundation

enum NetworkError: Error {
    case emptyData
}

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

class APIClient {
    lazy var urlSession: URLSessionProtocol = URLSession.shared
    
    func login(withName name: String, password: String, completionHandler: @escaping (String? , Error?) -> Void) {
        
        let allowedCharecters = CharacterSet.urlQueryAllowed
        
        guard
            let name = name.addingPercentEncoding(withAllowedCharacters: allowedCharecters),
              let password = password.addingPercentEncoding(withAllowedCharacters: allowedCharecters) else { fatalError() }
        
        let query = "name=\(name)&password=\(password)"
        guard let url = URL(string: "https://todoapp.com/login?\(query)") else { fatalError() }
        
        urlSession.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                return completionHandler(nil, error)
            }
            
            do {
            guard let data = data else {
                completionHandler(nil, NetworkError.emptyData)
                return
                
            }
            let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as! [String : String ]
            
            let token = dictionary["token"]
            completionHandler(token, nil)
            } catch {
                completionHandler(nil, error)

            }
        }.resume()
    }
}

