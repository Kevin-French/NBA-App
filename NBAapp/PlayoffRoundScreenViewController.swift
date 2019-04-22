//
//  PlayoffRoundScreenViewController.swift
//  NBAapp
//
//  Created by Parth Dhebar on 3/27/19.
//  Copyright © 2019 Parth Dhebar. All rights reserved.
//

//  the cell they clicked should now reflect the new series record.  If it was 2-2 and team 2 won, it should now be 2-3 and displayed as such in the cell.  Or maybe just print the new record if updating the cell is too much.

import UIKit

class PlayoffRoundScreenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedCellIndexPath: IndexPath?
    
    // "Model" (data)
    var easternSeries = Series.round1Series().eastern
    var westernSeries = Series.round1Series().western
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is GameViewController {
            let gameVC = segue.destination as! GameViewController
            gameVC.delegate = self
        }
    }
 

}

extension PlayoffRoundScreenViewController: GameViewControllerDelegate {
    func gameWonByTeam(_ teamNumber: Int) {
        print("Game won by team \(teamNumber)")
        
        // First want to update "model"
        
        // Created two variables to store Team values
        
        let homeTeam: Team
        let awayTeam: Team
        
        // If Western Series, get correspionding Home and Away teams
        // Else (Eastern Series) get correspionding Home and Away teams
        if selectedCellIndexPath?.section == 0 {
            let series = westernSeries[selectedCellIndexPath!.row]
            homeTeam = series.team1// HomeTeam from series
            awayTeam = series.team2// AwayTeam from series
        } else {
            let series = easternSeries[selectedCellIndexPath!.row]
            homeTeam = series.team1// HomeTeam from series
            awayTeam = series.team2// AwayTeam from series
        }
        
        // Created two variables to store scores for home/away teams
      
        let homeScore: Int
        let awayScore: Int
        
        // If/else statement to set the team score
        
        if teamNumber == 0 {
            homeScore = 120
            awayScore = 100
        } else {
            homeScore = 100
            awayScore = 120
        }
       
        // Variable to store home team, away team, home score, away score, and number of OTs
        
        let game = Game(homeTeam: homeTeam, awayTeam: awayTeam, homeScore: homeScore, awayScore: awayScore, numberofOT: 0)
       
        
        // If/else statement that adds new Game variable to correct series
        // in westernSeries or EasternSeries array
        
        if selectedCellIndexPath?.section == 0 {
            westernSeries[selectedCellIndexPath!.row].games.append(game)
        } else {
            easternSeries[selectedCellIndexPath!.row].games.append(game)
        }

        // Then want table view to refresh from updated "model"
        
        tableView.reloadData()
        
    }
}

extension PlayoffRoundScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let series: Series
        if indexPath.section == 0 {
            // Western Conference
            series = westernSeries[indexPath.row]
            
        } else {
            // Eastern Conference
            
            series = easternSeries[indexPath.row]
        }
        
        let team1 = series.team1
        let team2 = series.team2
        
        
        cell.textLabel?.text = "\(team1.seed) \(team1.name) vs. \(team2.seed) \(team2.name)"
        cell.detailTextLabel?.text = series.recordString()
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Western Conference"
        } else {
            return "Eastern Conference"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    
}

extension PlayoffRoundScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndexPath = indexPath
    }
}
