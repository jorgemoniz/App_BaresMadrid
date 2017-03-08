//
//  BMParserOmDb.swift
//  APP_BaresdeMadrid
//
//  Created by Jorge Moñiz on 8/3/17.
//  Copyright © 2017 jorgemoniz. All rights reserved.
//

import UIKit
import SwiftyJSON
import PromiseKit
import Alamofire

class BMParserOmDb: NSObject {
    
    var jsonDataOmDb : JSON?
    
    /// Crea la función de obtención de datos de OmDb y contiene un parámetro de entrada
    ///
    /// - parameter idNumero: El idNumero corresponde al número que puede variar entre 1 y 30, este número hace parte de la llamada.
    /// - returns: La promesa de un JSON -> implementa pods de PromiseKit / Alamofire / SwiftyJSON
    
    func getDatosOmDb(_ idNumero : String) -> Promise<JSON> {
        let request = URLRequest(url: URL(string: CONSTANTES.CONEXIONES_URL.BASE_URL_OMDB + idNumero)!)
        return Alamofire.request(request).responseJSON().then{(data) -> JSON in
            self.jsonDataOmDb = JSON(data)
            print(self.jsonDataOmDb!)
            return self.jsonDataOmDb!
            
        }
    }
    
    func getParserOmDb() -> [BMImdbModel] {
        var arrayDatosOmDb = [BMImdbModel]()
        for item in jsonDataOmDb!["Search"] {
            let datosModel = BMImdbModel(pTitle: dimeString(item.1, nombre: "Title"),
                                         pYear: dimeString(item.1, nombre: "Year"),
                                         pImdbId: dimeString(item.1, nombre: "imdbID"),
                                         pType: dimeString(item.1, nombre: "Type"),
                                         pPoster: dimeString(item.1, nombre: "Poster"))
            arrayDatosOmDb.append(datosModel)
        }
        return arrayDatosOmDb
    }
}
