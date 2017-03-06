//
//  ICOListaCustomCell.swift
//  App_CustomTVCell
//
//  Created by Jorge Moñiz on 11/1/17.
//  Copyright © 2017 jorgemoniz. All rights reserved.
//

import UIKit
import MapKit


class BMPosicionActualViewController: UIViewController {
    
    //MARK: - Variables locales
    
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    //MARK: - IBActions
    
    
    
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Gestión del Menú Superior
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rightViewRevealWidth = 150
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }


}

