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
        makeAPICall()
    }
    
    // MARK: - Properties
    
    let headers = [
        "x-rapidapi-key": "be6799ce2cmsh9aa44d9c44c0470p1d4553jsn36e752cd40ee",
        "x-rapidapi-host": "joke3.p.rapidapi.com"
    ]
//    let APIservice = APIServiceManager()
    var jokeString: String?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        makeAPICall()
    }
    
    
    // MARK: - Privates
    private func configureUI(){
        actionButton.layer.cornerRadius = 8
    }
    
    private func makeAPICall(){
        
        APIServiceManager.shared.getJokes { result in
            switch result{
            case .failure(let err):
                print("Debug: Error in \(err)")
                return
                
            case .success(let joke):
                
                self.jokeString = joke
                
                guard let jokestring = self.jokeString else {return}
                
                DispatchQueue.main.async {
                    self.jokeLabel.text = jokestring
                }
                
            }
        }
    }
    
}


// MARK: - Extensions



