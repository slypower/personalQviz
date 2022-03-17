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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    private func updateResult() {
        
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answersChosen.map {$0.animal}
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        /* или так
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }*/
        
        let sordedFrequencyOfAnimals = frequencyOfAnimals.sorted {$0.value > $1.value}
        guard let mostfFequencyAnimals = sordedFrequencyOfAnimals.first?.key else {return}
        
        
        /*
        //решение в одну строку
        let mostfFequencyAnimals = Dictionary(qrouping: answers) {$0.aminal}
            .sorted {$0.value.count > $1.value.count}
            .first?.key
        */
        
        updateUI(with: mostfFequencyAnimals)
    }
    
    private func updateUI(with animal: Animal?) {
        animalLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
        
        
}
