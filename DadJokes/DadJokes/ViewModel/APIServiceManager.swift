//
//  APIService.swift
//  DadJokes
//
//  Created by Ting Becker on 2/11/21.
//

import UIKit

class APIServiceManager {
    
    // MARK: - Properties
    static let shared = APIServiceManager()
    private let baseURL = "https://dad-jokes.p.rapidapi.com"
    
    let headers = [
        "x-rapidapi-key": "be6799ce2cmsh9aa44d9c44c0470p1d4553jsn36e752cd40ee",
        "x-rapidapi-host": "joke3.p.rapidapi.com"
    ]
    
    // MARK: - Lifecycle
    public init() {}
    
    
    // MARK: - Privates
    public func getJokes(completion: @escaping (Result<Any, CustomError>) -> Void){
        
        // 1. SPECIFY HEADER - let headers
        
        // 2. SPECIFY BODY - n/a
        
        // 3. SET REQUEST TYPE
        let endpoint = "https://joke3.p.rapidapi.com/v1/joke"
        
        // URL REQUEST
        let request = NSMutableURLRequest(url: NSURL(string: endpoint)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        // GET URLSession
        let session = URLSession.shared
        
        // CREATE DATA TASK
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            // handle error
            
            if error != nil && data != nil {
                completion(.failure(.invalidDatatask))
                return
                
            } else {
                // no error, proceed
                
                do {
                    // simple way
                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
//                    print(dictionary)
//                    print(dictionary?["content"])
                    
                    let decodable = try JSONDecoder().decode(Joke.self, from: data!)
                    print(decodable.content)
                    
                
//                    completion(.success(dictionary?["content"]))
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        // FIRE OFF DATATASK
        dataTask.resume()
    }
    
}
