//
//  CrewMember.swift
//  SpaceOpera2
//
//  Created by Patrick Wheeler on 11/20/23.
//

import Foundation
import SpriteKit

class CrewMember: SKShapeNode {

    var uniqueID: Int
    var crewmanName: String
    var size : CGFloat = 15

    init(uniqueID: Int, crewmanName: String) {
        self.uniqueID = uniqueID
        self.crewmanName = crewmanName

//      let texture = SKTexture(imageNamed: "crewMember") // Assuming you have an image for the crew member
//        super.init(texture: texture, color: .clear, size: texture.size())
        
        super.init()
        
        let circle = SKShapeNode(circleOfRadius: self.size)
        circle.fillColor = .white
        circle.strokeColor = .gray
        
        self.setScale(1.0)
        // could attach this to a property, and then make the crewMan with player attention scale up slightly
        
        addChild(circle)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

