//
//  FieldSurveydDetailViewController.swift
//  Field Survey
//
//  Created by Molly Farnam on 4/28/20.
//  Copyright © 2020 Molly Farnam. All rights reserved.
//

import UIKit

class FieldSurveydDetailViewController: UIViewController {
    @IBOutlet weak var animaliconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    var fieldSurvey: FieldSurvey?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        if let fieldSurvey = fieldSurvey {
            animalNameLabel.text = fieldSurvey.title
            dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
            descriptionLabel.text = fieldSurvey.description
            animaliconImageView.image = UIImage(named: fieldSurvey.classification.rawValue)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
