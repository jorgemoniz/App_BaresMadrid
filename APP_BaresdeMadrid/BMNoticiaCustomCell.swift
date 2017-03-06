//
//  BMNoticiaCustomCell.swift
//  APP_BaresdeMadrid
//
//  Created by Jorge Moñiz on 6/3/17.
//  Copyright © 2017 jorgemoniz. All rights reserved.
//

import UIKit

class BMNoticiaCustomCell: UITableViewCell {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myImagenNoticia: UIImageView!
    @IBOutlet weak var myTituloNoticiaLBL: UILabel!
    @IBOutlet weak var myThumbnailNoticia: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
