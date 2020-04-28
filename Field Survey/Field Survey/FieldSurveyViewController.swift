//
//  FieldSurveyViewController.swift
//  Field Survey
//
//  Created by Molly Farnam on 4/28/20.
//  Copyright © 2020 Molly Farnam. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var fieldSurveyTableView: UITableView!
    
    let jsonFileName = "field_observations"
    var fieldSurvey: FieldSurveys?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        fieldSurvey = FieldSurveysLoader.load(jsonFileName: jsonFileName)
        
        if fieldSurvey == nil {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldSurvey?.observations.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fieldSurveyTableView.dequeueReusableCell(withIdentifier: "fieldSurveyCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell,
            let fieldSurvey = fieldSurvey?.observations[indexPath.row] {
            cell.animalLabel.text = fieldSurvey.title
            cell.dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
            cell.animalIconImageView.image = UIImage(named: fieldSurvey.classification.rawValue)
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldSurveydDetailViewController,
            let selectedIndexPath = fieldSurveyTableView.indexPathForSelectedRow {
            destination.fieldSurvey = fieldSurvey?.observations[selectedIndexPath.row]
        }
    }
    
      func presentMessage(message: String) {
          let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          present(alertController, animated: true, completion: nil)
      }
    
    
}
