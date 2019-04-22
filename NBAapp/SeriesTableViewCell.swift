//
//  SeriesTableViewCell.swift
//  NBAapp
//
//  Created by Parth Dhebar on 4/4/19.
//  Copyright © 2019 Parth Dhebar. All rights reserved.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {

    @IBOutlet weak var awayTeamImage: UIImageView!
    @IBOutlet weak var homeTeamImage: UIImageView!
    @IBOutlet weak var seriesLavel: UILabel!
    
    var series: Series? {
        didSet {
            guard let series = series else { return }
            //awayTeamImage.image =
            //homeTeamImage.image =
            seriesLavel.text = series.recordString()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
