//
//  API_UTILS.swift
//  APP_BaresdeMadrid
//
//  Created by Jorge Moñiz on 6/3/17.
//  Copyright © 2017 jorgemoniz. All rights reserved.
//

import Foundation
import UIKit

let CONSTANTES = Constantes()

struct Constantes{
    let COLORES = Colores()
    let CONEXIONES_URL = Baseurl()
}

struct Colores {
    let COLOR_AMARILLO_BARRA_NAVEGACION = #colorLiteral(red: 0.9591764808, green: 0.8025100827, blue: 0.04652624577, alpha: 1)
    let COLOR_AMARILLO_TAB_BAR = #colorLiteral(red: 0.9591764808, green: 0.8025100827, blue: 0.04652624577, alpha: 1)
    let COLOR_NEGRO_BARRA_NAV_TAB_BAR = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}

struct Baseurl {
    let BASE_URL_NOTICIAS = "https://jsonplaceholder.typicode.com/photos"
    let BASE_URL_OMDB = "http://www.omdbapi.com/?s=Batman&page="
}
