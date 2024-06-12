//
//  Starfield.swift
//  SpaceOpera2
//
//  Created by Patrick Wheeler on 11/21/23.
//

import Foundation
import SpriteKit

class Starfield: SKNode {

    let numberOfStars = 30 // You can modify this value as needed

    init(size: CGSize) {
        super.init()

        createStars(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createStars(size: CGSize) {
        for _ in 1...numberOfStars {
            let star = SKShapeNode(circleOfRadius: 1)
            star.fillColor = .white

            // Generate random positions for the stars
            let randomX = CGFloat.random(in: 0...size.width) - size.width/2
            let randomY = CGFloat.random(in: 0...size.height) - size.height/2
            star.position = CGPoint(x: randomX, y: randomY)

            addChild(star)
        }
    }
    
    // should make an moveStars() func that accepts a distance or a speed
    // if a star moves beyond the edges of the screen, we should move it to the other side
    
    // I would also like to add variance in star size relating to multiplaneZ value
    // multiplaneZ value will effect how fast the stars move
    
    // in the future, if the ship is going fast enough, we should transform the shapes
    // into either elipses or simply lines, with relation to spaceship heading
    // although potentially, we might choose universe physics in which heading and direction of travel are NOT always the same.
}
