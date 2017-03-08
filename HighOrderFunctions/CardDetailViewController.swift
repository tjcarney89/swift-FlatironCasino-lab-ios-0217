//
//  CardDetailViewController.swift
//  HighOrderFunctions
//
//  Created by Jim Campagno on 3/4/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var cardsLabel: UILabel!
    @IBOutlet weak var diamondsLabel: UILabel!
    @IBOutlet weak var heartsLabel: UILabel!
    @IBOutlet weak var clubsLabel: UILabel!
    @IBOutlet weak var spadesLabel: UILabel!
    
    @IBOutlet weak var scoresLabel: UILabel!
    @IBOutlet weak var diamondScoreLabel: UILabel!
    @IBOutlet weak var heartScoreLabel: UILabel!
    @IBOutlet weak var clubScoreLabel: UILabel!
    @IBOutlet weak var spadeScoreLabel: UILabel!
    
    var cards: [Card] = []
    private var scores: [Suit : Int] = [
        .hearts : 0,
        .spades : 0,
        .diamonds : 0,
        .clubs : 0
    ]
    
    // card piles
    private var diamonds: [Card] = []
    private var hearts: [Card] = []
    private var clubs: [Card] = []
    private var spades: [Card] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        containerView.layer.cornerRadius = 15.0
        containerView.layer.masksToBounds = true
        setupDismissButton()
        flipAllCardsFaceUp()
        separateIntoPiles()
        orderAllCards()
        calculateScores()
        printAllPiles()
        diamondsLabel.text = "Diamonds: \(getCardsFromArray(array: diamonds))"
        heartsLabel.text = "Hearts: \(getCardsFromArray(array: hearts))"
        clubsLabel.text = "Clubs: \(getCardsFromArray(array: clubs))"
        spadesLabel.text = "Spades: \(getCardsFromArray(array: spades))"
        if let diamondsScore = scores[.diamonds] {
            diamondScoreLabel.text = "Diamonds: \(diamondsScore)"
        }
        if let heartsScore = scores[.hearts] {
            heartScoreLabel.text = "Hearts: \(heartsScore)"
        }
        if let clubsScore = scores[.clubs] {
            clubScoreLabel.text = "Clubs: \(clubsScore)"
        }
        if let spadesScore = scores[.spades] {
            spadeScoreLabel.text = "Spades: \(spadesScore)"
        }
        
        
    }
    
    func getCardsFromArray(array: [Card]) -> String {
        var individualCards: String = ""
        for card in array {
            individualCards += " \(card)"
        }
        return individualCards
    }
    
    func flipAllCardsFaceUp() {
        
        cards.forEach { (card) in
            if card.isFaceUp != true {
                card.flipCard()
            }
        }
        // TODO: Go through each card in the cards array, making sure each one is face up. If it's not, flip it! (there's a flipCard method available to Cards). Do not use a for-in lool, use forEach only.
    }
    
    func separateIntoPiles() {
        diamonds = cards.filter { $0.suit == .diamonds }
        hearts = cards.filter { $0.suit == .hearts }
        clubs = cards.filter { $0.suit == .clubs }
        spades = cards.filter {$0.suit == .spades }
            // TODO: Separate all of the cards into separate piles (using the diamonds, hearts, clubs and spades stored properties). Use filter. Also, use filter four times in a row (yes I know it's not efficient). Don't look to solve this problem using a for-in statement.
    }
    
    func orderAllCards() {
        diamonds.sortCards()
        hearts.sortCards()
        clubs.sortCards()
        spades.sortCards()
        // TODO: All cards in the diamonds, hearts, clubs and spades stored properties should be sorted. As in, [Ace, 2, 3, 4...Q, K]. Note that you won't always have to deal with all 52 cards to sort considering that it's dependent on what cards the user played (at random) from the prior View Controller. Navigate to the Card.swift file and scroll to the bottom to find an extention on an Array. There's a method called sortCards() which you should implement. After implementing that function, you should go through and call sortCards() on all four arrays representing our different piles.
    }
    
    func calculateScores() {
        let allPiles = [diamonds, hearts, clubs, spades]
        
        
        
        allPiles.forEach { pile in
                let score = pile.reduce(0, { $0 + $1.rank.value } )
                guard let suit = pile.first?.suit else { return }
                scores[suit] = score

        }
        
        // TODO: Create a constant called allPiles, assigning it a value being an Array containing diamonds, hearts, clubs, spades (which are stored properties available on the View Controller. You should then look to go through each pile to then figure out what the total score is for each pile and properly update within the scores dictionary the total score pertaining to that particular suit (as the piles are separated by suit).
        // TODO: In your implementation of this function, you should only have to use forEach and reduce. You are not allowed to use a for-in loop.
    }
    
    func printAllPiles() {
        print("Diamonds: \(diamonds)")
        print("Hearts: \(hearts)")
        print("Spades: \(spades)")
        print("Clubs: \(clubs)")
        print("Scores: \(scores)")
        print("--------------------\n")
    }
}

// MARK: - Helper Methods
extension CardDetailViewController {
    
    func setupDismissButton() {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        button.frame = view.frame
        view.insertSubview(button, belowSubview: containerView)
        
    }
    
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
