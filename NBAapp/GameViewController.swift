//
//  GameViewController.swift
//  NBAapp
//
//  Created by Parth Dhebar on 3/27/19.
//  Copyright © 2019 Parth Dhebar. All rights reserved.
//

import UIKit

protocol GameViewControllerDelegate {
    func gameWonByTeam(_ teamNumber: Int)
    
}

class GameViewController: UIViewController {
    
    var delegate: GameViewControllerDelegate?

    @IBOutlet weak var teamButton: UIButton!
    @IBOutlet weak var teamTwoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func teamOneWinner(_ sender: UIButton) {
        delegate?.gameWonByTeam(0)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func teamTwoWinner(_ sender: UIButton) {
        delegate?.gameWonByTeam(1)
        navigationController?.popViewController(animated: true)
    }
    
    

}
