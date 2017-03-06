//
//  BMListaNoticiasTableViewController.swift
//  APP_BaresdeMadrid
//
//  Created by Jorge Moñiz on 6/3/17.
//  Copyright © 2017 jorgemoniz. All rights reserved.
//

import UIKit
import PromiseKit
import Kingfisher
import PKHUD

class BMListaNoticiasTableViewController: UITableViewController {
    
    //MARK: - Variables locales
    var arrayNoticias : [BMNoticiasModel] = []
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var extraMenuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LLAMADA A DATOS
        llamadaNoticias()
        
        // REGISTRAMOS EL XIB
        tableView.register(UINib(nibName: "BMNoticiaCustomCell", bundle: nil), forCellReuseIdentifier: "NoticiaCustomCell")

        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rightViewRevealWidth = 150
            extraMenuButton.target = revealViewController()
            extraMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNoticias.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticiaCustomCell", for: indexPath) as! BMNoticiaCustomCell

        // Configure the cell...
        let model = arrayNoticias[indexPath.row]
        
        cell.myTituloNoticiaLBL.text = model.title
        cell.myImagenNoticia.kf.setImage(with: URL(string: model.url!),
                                         placeholder: #imageLiteral(resourceName: "placehoder"),
                                         options: nil,
                                         progressBlock: nil,
                                         completionHandler: nil)
        
        cell.myThumbnailNoticia.kf.setImage(with: URL(string: model.thumbnailUrl!),
                                         placeholder: #imageLiteral(resourceName: "placehoder"),
                                         options: nil,
                                         progressBlock: nil,
                                         completionHandler: nil)

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 415
    }
    
    //MARK: - UTILS
    func llamadaNoticias() {
        let datosNoticias = BMParserNoticias()
        HUD.show(.progress)
        firstly{
            return when(resolved: datosNoticias.getDatosNoticias())
        }.then{_ in
            self.arrayNoticias = datosNoticias.getParserNoticias()
        }.then{_ in
            self.tableView.reloadData()
        }.then{_ in
            HUD.hide(afterDelay: 0)
        }.catch{error in
            self.present(muestraAlertVC("", messageData: "", titleActionData: ""), animated: true, completion: nil)
        }
    }
}
