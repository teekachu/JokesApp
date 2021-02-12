//
//  MainViewController.swift
//  DadJokes
//
//  Created by Ting Becker on 2/10/21.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IB-Properties
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var labelStackView: UIStackView!
    
    @IBAction func moreJokesTapped(_ sender: Any) {
        print("show me more")
    }
    
    
    // MARK: - Properties
    
    let headers = [
        "x-rapidapi-key": "be6799ce2cmsh9aa44d9c44c0470p1d4553jsn36e752cd40ee",
        "x-rapidapi-host": "joke3.p.rapidapi.com"
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        makeAPICall()
    }
    
    
    // MARK: - Privates
    private func configureUI(){
        actionButton.layer.cornerRadius = 8
        jokeLabel.text = "Placeholder text here"
    }
    
    private func makeAPICall(){
        
        // URL End point
        let endpoint = "https://joke3.p.rapidapi.com/v1/joke"
        
        // URL REQUEST
        let request = NSMutableURLRequest(url: NSURL(string: endpoint)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        // SPECIFY THE HEADER
        request.allHTTPHeaderFields = headers
        
        // SPECIFY THE BODY
        //        let jsonObject = [
        //            "_id":"5f80ccd641785ba7c7d27b99",
        //            "punchline":"Join the club.",
        //            "setup":"Bad at golf?",
        //            "type":"general"
        //        ] as [String:Any]
        //
        //        do{
        //            let requestBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
        //
        //            request.httpBody = requestBody
        //        } catch {
        //            print("Error creating data object from JSON")
        //        }
        
        // SET REQUEST TYPE / HTTP Method (All end points are GET requests)
        //        request.httpMethod = "POST"
        
        
        // GET URLSession
        let session = URLSession.shared
        
        // CREATE DATA TASK
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil && data != nil) {
                print("error: \(error?.localizedDescription)")
                return
                
            } else {
                do{
                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                    print(dictionary)
                    
                } catch {
                    print("Error parsing response data")
                }
            }
        })
        
        
        
        // FIRE OFF DATATASK
        dataTask.resume()
    }
}


// MARK: - Extensions



