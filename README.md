# Flatiron Casino

![](http://i.imgur.com/Kr9XSmB.jpg?1)

A lot of this project has already been built for you. The point of this lab is not to have you create everything from scratch. Instead, you will be working with a code base that has most of what you need already implemented. Before beginning the lab, take a look around the various files to see how things were implemented. This lab is to get you to use higher-order functions like map, filter, reduce and forEach.

Note: In your implementation of the following tasks, you are _not_ allowed to use a for-in loop. This is to force you to become familiar with higher-order functions. Stay out of your comfort zone, challenge yourself and learn!

You should find that `printAllPiles()` is getting called in the `CardDetailViewController` which should help you debug any problems while you're implementing the tasks below.

The main tasks that you will be implementing are the following (all of these tasks are marked as TODO in the code base):  
* Create a deck (which won't be a separate class, it will be an array of `Card`s) in the `CasinoViewController` class.
* Implement the `playCard(_:)` method available to the `CasinoViewController` class. This method fires off as soon as a tap occurs within the green felt (`greenFeltImageView`).
* Implement the `prepare(for:sender:)` method passing forward any dealt cards to the `cards` stored property on `CardDetailViewController`.
* Navigate to the `CardDetailViewController.swift` file.
* `CardDetailViewController` type should flip all of the cards handed to it. You should find that the TODO asks that you only use the `forEach` method instead of a for-in loop.
* `CardDetailViewController` should be able to separate all of the cards into different piles. You should find four stored properties available to you which should wind up holding on to the necessary cards associated with the name of that variable. For example, all diamond cards should wind up in the `diamonds` stored property.
* The `CardDetailViewController` should be able to sort all of the cards in each of its piles. They should be sorted as [Ace, 2, 3, 4 ... Q, K, A] for all four of the piles.
* The `CardDetailViewController` has a `scores` stored property on it of type [`Suit` : `Int`] which should represent the total scores of all the cards within that particular pile. Implement the `calculateScores()` adhering to the TODO comment. You should look to go through all of the piles, tallying up the total score for each pile while updating the `scores` dictionary to reflect this total value (pertaining to the particular suit).

## Advanced:
Navigate to the `Main.storyboard`. You should find that the `CardDetailViewController` is kine of bland. At this point, you should have a lot of data that we can display within this view. It's up to you how to go about doing this, but you should display all of the values you calculated above.

* The total scores pertaining to their suits should be displayed.
* Each pile should display all of its cards. A stack view might be your friend here. Or not. Implement this how you like.
* Have fun with it!
