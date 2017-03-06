//
//  BMNoticiasModel.swift
//  APP_BaresdeMadrid
//
//  Created by Jorge Moñiz on 6/3/17.
//  Copyright © 2017 jorgemoniz. All rights reserved.
//

import UIKit

class BMNoticiasModel: NSObject {
    
    var albumId : Int?
    var id : Int?
    var title : String?
    var url : String?
    var thumbnailUrl : String?

    
    init(pAlbumId : Int, pId : Int, pTitle : String, pUrl : String, pThumbnailUrl : String) {
        self.albumId = pAlbumId
        self.id = pId
        self.title = pTitle
        self.url = pUrl
        self.thumbnailUrl = pThumbnailUrl
        super.init()
    }
}
