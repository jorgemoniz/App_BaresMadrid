//
//  BMImdbModel.swift
//  APP_BaresdeMadrid
//
//  Created by Jorge Moñiz on 6/3/17.
//  Copyright © 2017 jorgemoniz. All rights reserved.
//

import UIKit

class BMImdbModel: NSObject {
    
    var title : String?
    var year  : String?
    var imdbID : String?
    var type : String?
    var poster : String?

    init(pTitle : String, pYear : String, pImdbId : String, pType : String, pPoster : String) {
        self.title = pTitle
        self.year = pYear
        self.imdbID = pImdbId
        self.type = pType
        self.poster = pPoster
        super.init()
    }
}
