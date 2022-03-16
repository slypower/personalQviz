//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Виталий Бобрик on 15.03.22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer] = []

    var dogs:[Animal] = []
    var cats:[Animal] = []
    var rabbits:[Animal] = []
    var turtles:[Animal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
       
        for answer in answersChosen {
            
            if answer.animal == .dog {
                dogs.append(answer.animal)
            } else if answer.animal == .cat {
                cats.append(answer.animal)
            } else if answer.animal == .rabbit {
                rabbits.append(answer.animal)
            } else if answer.animal == .turtle {
                turtles.append(answer.animal)
            }
        }
        
        let animals = [dogs, cats, rabbits, turtles]
        
        let maximumCountArrayEnimals = getMaximumCountArrayEnimals(from: animals)
        
        let animal = maximumCountArrayEnimals.first
        
        animalLabel.text = "Вы - \(String(describing: animal!.rawValue))!"
        descriptionLabel.text = animal?.definition
        
    }
   
    private func getMaximumCountArrayEnimals(from arrays: [[Animal]]) -> [Animal] {
        guard let maxArray = arrays.max(by: {(a, b) -> Bool in
            return a.count < b.count
        }) else { return arrays.first! }
        return maxArray
    }
    
}
