//
//  BMPosicionActualViewController.swift
//  APP_BaresdeMadrid
//
//  Created by JUAN CARLOS PEREZ MARTINEZ on 26/2/17.
//  Copyright © 2017 JC. All rights reserved.
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

