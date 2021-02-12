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
    let APIservice = APIServiceManager()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // call APIService to get the joke
        
        let dictionary = APIservice.getJokes { result in
            switch result{
            case .failure(let err):
                print(err)
                return
                
            case .success(let joke):
                print(joke)
            }
        }
    }
    
    
    // MARK: - Privates
    private func configureUI(){
        actionButton.layer.cornerRadius = 8
        jokeLabel.text = "Placeholder text here"
    }
    
}


// MARK: - Extensions



