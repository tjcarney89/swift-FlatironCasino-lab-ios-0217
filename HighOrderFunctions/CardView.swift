//
//  CardView.swift
//  HighOrderFunctions
//
//  Created by Jim Campagno on 3/4/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import UIKit

protocol CardViewDelegate: class {
    func cardView(_ cardView: CardView, willFlipCard card: Card)
    func cardView(_ cardView: CardView, didFinishFlippingCard card: Card)
}

class CardView: UIView {
    
    static private let aspectRatio: (w: CGFloat, h: CGFloat) = (223, 312)
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var cardImageView: UIImageView!
    private let backOfCardImage = #imageLiteral(resourceName: "Back")
    weak var delegate: CardViewDelegate?
    var card: Card! {
        didSet {
            cardImageView.image = card.image
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CardView", owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.constrainEdges(to: self)
        cardImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        cardImageView.addGestureRecognizer(tapGesture)
    }
    
    func flipCard(_ sender: UITapGestureRecognizer) {
        delegate?.cardView(self, willFlipCard: card)
        cardImageView.isUserInteractionEnabled = false
        UIView.transition(with: cardImageView, duration: 0.6, options: .transitionFlipFromLeft, animations: {
            self.cardImageView.image = self.card.isFaceUp ? self.backOfCardImage : self.card.image
        }, completion: { _ in
            self.card.flipCard()
            self.cardImageView.isUserInteractionEnabled = true
            self.delegate?.cardView(self, didFinishFlippingCard: self.card)
        })
    }
    
    static func height(from width: CGFloat) -> CGFloat {
        let multiplyValue: CGFloat = 1.0 + ((aspectRatio.h - aspectRatio.w) / aspectRatio.w)
        return width * multiplyValue
    }

}


//MARK: - Helper Functions
extension UIView {
    
    func constrainEdges(to view: UIView) {
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
