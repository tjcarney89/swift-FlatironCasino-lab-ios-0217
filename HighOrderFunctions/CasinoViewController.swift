//
//  CasinoViewController.swift
//  HighOrderFunctions
//
//  Created by Jim Campagno on 3/4/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import UIKit

class CasinoViewController: UIViewController {

    @IBOutlet weak var greenFeltImageView: UIImageView!
    var undealtCards: [Card] = []
    var dealtCards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapGesture()
        createDeck()
    }
    
    func setupTapGesture() {
        greenFeltImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(playCard))
        greenFeltImageView.addGestureRecognizer(tapGesture)
    }
    
    func createDeck() {
        // TODO: Create a deck (array of Cards) and assign this value to the undealtCards stored property. Force yourself to use flatpMap (only once) and map (only once) to solve this problem. Hint: Suit.all and Rank.all are your friends. After undealtCards equals this new value (being an Array of cards), shuffle it using the shuffle() method available to Arrays which we're providing for you.
        undealtCards = Suit.all.flatMap { suit in
            Rank.all.map { rank in
             return Card(rank: rank, suit: suit)
            }
        }
        undealtCards.shuffle()
    }
    
    func playCard(_ sender: UITapGestureRecognizer) {
        // TODO: Use popLast to grab the last card in the undealtCards array.
        // TODO: Append that card to the dealtCards array.
        // TODO: Create a constant called point where its value will equal the return value to a call to the location(in:) method on sender passing in the greenFeltImageView in as an argument. This will give us the precise location of the tap of the user.
        // TODO: Use this point and pass it along to a call to the createCardView(at:) method which will give you back a new CardView instance. Store this in a constant called cardView.
        // TODO: Assign the card grabbed in the first TODO listed here to the card stored property available on your cardView constant. This will display on screen the card which was grabbed from our undealtCards array.
        guard let card = undealtCards.popLast() else { return }
        dealtCards.append(card)
        let point = sender.location(in: greenFeltImageView)
        let cardView = createCardView(at: point)
        cardView.card = card
    }
    
    func createCardView(at point: CGPoint) -> CardView {
        let width = view.frame.width * 0.2
        let height = CardView.height(from: width)
        let x = point.x - width * 0.5
        let y = point.y - height * 0.5
        let origin = CGPoint(x: x, y: y)
        let size = CGSize(width: width, height: height)
        let frame = CGRect(origin: origin, size: size)
        let cardView = CardView(frame: frame)
        cardView.delegate = self
        greenFeltImageView.addSubview(cardView)
        return cardView
    }
    
    @IBAction func showStats(_ sender: Any) {
        performSegue(withIdentifier: "CardsDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Get a hold of where we're going through the destination property available on instances of UIStoryboardSegue and store that in a constant called destVC
        // TODO: destVC should have a stored property called cards. Assign dealtCards to this stored property which ultimately passes along all of the dealtCards (what the user sees on screen) to the cards stored property on our instance of CardDetailViewController (where we're going, the next screen).
        let destVC = segue.destination as! CardDetailViewController
        destVC.cards = dealtCards
    }

}

//MARK: - CardViewDelegate Methods
extension CasinoViewController: CardViewDelegate {
    
    func cardView(_ cardView: CardView, willFlipCard card: Card) {
        greenFeltImageView.isUserInteractionEnabled = false
    }
    
    func cardView(_ cardView: CardView, didFinishFlippingCard card: Card) {
        greenFeltImageView.isUserInteractionEnabled = true
    }

}
