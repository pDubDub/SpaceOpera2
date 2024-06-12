//
//  SpaceshipCrew.swift
//  SpaceOpera2
//
//  Created by Patrick Wheeler on 11/20/23.
//

import Foundation
import SpriteKit

class SpaceshipCrew: SKNode {

    var spaceship: Spaceship!
    var crewMembers: [CrewMember] = []
    var crewYPosition: CGFloat = 0

    init(yPosition: CGFloat) {
        super.init()
        crewYPosition = yPosition   // receive screen position from GameScene
        createSpaceship()
        createCrewMembers()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createSpaceship() {
        // Create and add spaceship to the crew
        spaceship = Spaceship(uniqueID: 1, shipName: "Main Spaceship")
        addChild(spaceship)
    }

    private func createCrewMembers() {
        // Create and add crew members to the array
        for i in 1...5 { // You can adjust the number of crew members as needed
            let crewMember = CrewMember(uniqueID: i, crewmanName: "Crew Member \(i)")
            crewMembers.append(crewMember)
            addChild(crewMember)
        }

        // Position crew members (example: arrange them in a row)
        var xOffset: CGFloat = 0
        for crewMember in crewMembers {
            crewMember.position = CGPoint(x: xOffset, y: crewYPosition)
            xOffset += crewMember.size + 10
        }
    }
}

