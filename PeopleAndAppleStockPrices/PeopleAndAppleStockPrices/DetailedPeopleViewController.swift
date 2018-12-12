//
//  DetailedPeopleViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jabeen's MacBook on 12/11/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit




class DetailedPeopleViewController: UIViewController {
    
    var personcontactDetails: resultWrapper!

    
    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var personEmail: UILabel!
    
    @IBOutlet weak var personLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContactInfo()
        do {
            let imageData = try Data(contentsOf: personcontactDetails.picture.large)
            personImage.image = UIImage(data: imageData)
        } catch {
            print("Error")
        }
        
    }

    func updateContactInfo() {
        personName.text = personcontactDetails.name.fullName
        personEmail.text = personcontactDetails.email
        personLocation.text = personcontactDetails.location.city
    }







}
