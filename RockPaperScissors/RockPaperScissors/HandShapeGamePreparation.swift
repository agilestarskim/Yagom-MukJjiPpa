//
//  HandGame.swift
//  RockPaperScissors
//
//  Created by Minsup, Whales on 2023/05/04.
//

class HandShapeGamePreparation {
    enum GameResult: Equatable {
        case end, again, next(Turn)
    }

    enum Turn: String {
        case user = "사용자", computer = "컴퓨터", none
    }

    enum HandShape: String, CaseIterable {
        case scissors = "1", rock = "2", paper = "3"
    }

    func printMenu(text: String) {
        print(text, terminator: " ")
    }
    
    func generateComputerHandShape() -> HandShape? {
        return HandShape.allCases.randomElement()
    }
    
    func convertHandShape(from shapeNumber: String?) -> HandShape? {
        guard let shapeNumber = shapeNumber else { return nil }
        return HandShape(rawValue: shapeNumber)
    }
}
