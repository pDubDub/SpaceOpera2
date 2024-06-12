//
//  Spaceship.swift
//  SpaceOpera2
//
//  Created by Patrick Wheeler on 11/20/23.
//

import Foundation
import SpriteKit

class Spaceship: SKShapeNode {

    var uniqueID: Int
    var shipName: String
    var heading: CGFloat = 0.0 {
        didSet {
            updateHeading()
        }
    }
    
    // should add a speed property
    
    private var shipShape: SKShapeNode!
    private var shipLabel: SKLabelNode!

    init(uniqueID: Int, shipName: String) {
        self.uniqueID = uniqueID
        self.shipName = shipName

        super.init()

        // Create a small triangle shape for the spaceship
        let spaceshipPath = CGMutablePath()
        print(self.position)
        spaceshipPath.move(to: CGPoint(x: 0, y: 20))
        spaceshipPath.addLine(to: CGPoint(x: 12, y: -20))
        spaceshipPath.addLine(to: CGPoint(x: 0, y: -14))
        spaceshipPath.addLine(to: CGPoint(x: -12, y: -20))
        spaceshipPath.closeSubpath()

        shipShape = SKShapeNode(path: spaceshipPath)
        shipShape.fillColor = .clear
        shipShape.strokeColor = .white
        addChild(shipShape)
        
        shipLabel = SKLabelNode(text: shipName)
        shipLabel.position = CGPoint(x: 0, y: -40)
        shipLabel.fontColor = .white
        shipLabel.fontSize = 14
        addChild(shipLabel)
        
        updateHeading()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateHeading() {
        // Update the rotation of the spaceship based on the heading
        shipShape.zRotation = heading
    }
}

