//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setView()
    }
    
    private func setView() {
        
        let animalAnswers = answersChosen.map { $0.animal }
        let numberOfEachAnimals = animalAnswers.reduce(into: [:]) { numberOfAnimal, animal in
            numberOfAnimal[animal, default: 0] += 1
        }
        let sortedNumberOfEachAnimals = numberOfEachAnimals.sorted { $0.value > $1.value }
        guard let resultAnimal = sortedNumberOfEachAnimals.first?.key else { return }
        
        resultLabel.text = "Вы - \(resultAnimal.rawValue)"
        resultDescriptionLabel.text = resultAnimal.definition
    }
}


