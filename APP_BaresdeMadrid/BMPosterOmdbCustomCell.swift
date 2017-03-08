//
//  BMPosterOmdbCustomCell.swift
//  APP_BaresdeMadrid
//
//  Created by Jorge Moñiz on 8/3/17.
//  Copyright © 2017 jorgemoniz. All rights reserved.
//

import UIKit

class BMPosterOmdbCustomCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myImagenPoster: UIImageView!
    @IBOutlet weak var myTituloLBL: UILabel!
    @IBOutlet weak var myYearLBL: UILabel!
    @IBOutlet weak var myIdLBL: UILabel!
    @IBOutlet weak var myTipoLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
