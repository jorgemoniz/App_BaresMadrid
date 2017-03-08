//: Playground - noun: a place where people can play

import UIKit

//Segundo método de persistencia con el protocolo -> NSCoding
class Persona : NSObject, NSCoding {
    
    var nombre : String!
    var apellido : String!
    var direccion : String!
    var email : String!
    var wifi : String!
    var edad : String!
    var movil : String!
    
    init(pNombre : String, pApellido : String, pDireccion : String, pEmail : String, pWifi : String, pEdad : String, pMovil : String) {
        self.nombre = pNombre
        self.apellido = pApellido
        self.direccion = pDireccion
        self.email = pEmail
        self.wifi = pWifi
        self.edad = pEdad
        self.movil = pMovil
    }
    
    //Codificación
    required convenience init?(coder aDecoder: NSCoder) {
        let nombreDe = aDecoder.decodeObject(forKey: "nombreKey") as! String
        let apellidoDe = aDecoder.decodeObject(forKey: "apellidoKey") as! String
        let direccionDe = aDecoder.decodeObject(forKey: "direccionKey") as! String
        let emailDe = aDecoder.decodeObject(forKey: "emailKey") as! String
        let wifiDe = aDecoder.decodeObject(forKey: "wifiKey") as! String
        let edadDe = aDecoder.decodeObject(forKey: "edadKey") as! String
        let movilDe = aDecoder.decodeObject(forKey: "movilKey") as! String
        
        self.init(pNombre : nombreDe, pApellido : apellidoDe, pDireccion : direccionDe, pEmail : emailDe, pWifi : wifiDe, pEdad : edadDe, pMovil : movilDe)
    }
    
    //Decodificación
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.nombre, forKey: "nombreKey")
        aCoder.encode(self.apellido, forKey: "apellidoKey")
        aCoder.encode(self.direccion, forKey: "direccionKey")
        aCoder.encode(self.email, forKey: "emailKey")
        aCoder.encode(self.wifi, forKey: "wifiKey")
        aCoder.encode(self.edad, forKey: "edadKey")
        aCoder.encode(self.movil, forKey: "movilKey")
    }
}

var multitud = [Persona]()

multitud.append(Persona(pNombre: "Jorge",
                        pApellido: "Moñiz",
                        pDireccion: "Calle Povedilla Nº5",
                        pEmail: "info@info.com",
                        pWifi: "112233445566aS",
                        pEdad: "42",
                        pMovil: "606000000"))

multitud.append(Persona(pNombre: "Felipe",
                        pApellido: "Eljaiek",
                        pDireccion: "Calle General Pardiñas Nº57",
                        pEmail: "mail@mail.com",
                        pWifi: "123455678546",
                        pEdad: "35",
                        pMovil: "609000000"))

// Este array de multitud podemos convertirlo en un objeto serializable
// Tenemos que tener una ruta del fichero, en la que vamos a persistir la información
// URL? -> porque puede o no existir esa ruta.

func dataBaseUrl() -> URL? {
    if let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
        let customUrl = URL(fileURLWithPath: documentDirectory)
        return customUrl.appendingPathComponent("multitud.data")
    } else {
        return nil
    }
}

func salvarInfo() {
    // Si tengo una url guardada en dataBaseUrl -> Archivo con la propiedad path la ruta del fichero.
    if let urlData = dataBaseUrl() {
        NSKeyedArchiver.archiveRootObject(multitud, toFile: urlData.path)
        //print(urlData.path)
    } else {
        print("Error guardando datos")
    }
}

func cargarDatos() {
    if let urlData = dataBaseUrl() {
        if let datosSalvados = NSKeyedUnarchiver.unarchiveObject(withFile: urlData.path) as? [Persona] {
            multitud = datosSalvados
        } else {
            print("Error leyendo datos")
        }
    }
}

//1
salvarInfo()
//2
multitud.removeAll()
//3
cargarDatos()

for c_persona in multitud {
    print("Nombre: \nApellido:")
}